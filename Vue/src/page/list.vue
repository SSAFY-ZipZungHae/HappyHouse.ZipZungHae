<template>
  <div>
    <input type="text" v-model="title" @keypress.enter="searchEmp">
    <button @click="searchEmp">검색</button>
    <div v-if="items.length">
      <table class="table table-bordered table-condensed">
        <colgroup>
          <col :style="{ width: '5%' }" />
          <col :style="{ width: '50%' }" />
          <col :style="{ width: '10%' }" />
          <col :style="{ width: '25%' }" />
        </colgroup>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>날짜</th>
        </tr>
        <list-row
          v-for="(item, index) in searchemps"
          :key="`${index}_items`"
          :no="item.no"
          :title="item.title"
          :writer="item.writer"
          :regtime="item.regtime"
        />
      </table>
    </div>
    <div v-else>글이 없습니다.</div>
    <div class="text-right">
      <button class="btn btn-primary" @click="movePage">등록</button>
    </div>
  </div>
</template>

<script>
import axios from "axios";

import ListRow from '@/components/Row.vue';
export default {
  name: 'list',
  components: {
    ListRow,
  },
  data: function() {
    return {
      items: [],
      searchemps: [],
      title:'',
    };
  },
  created() {
    axios.get('http://localhost/api/board')
      .then(({ data }) => {
        this.items = data;
        this.searchemps=data;
      })
      .catch(() => {
        alert('에러가 발생했습니다.');
      });
  },
  methods: {
    movePage() {
      this.$router.push('/create');
    },
    searchEmp(){
      if(this.title){
        axios.get('http://localhost/api/board')
        .then(({ data }) => {
          this.searchemps = data.filter((data) => {
          return data.title.includes(this.title);
        });

      });
    }
  },
  },
};
</script>

<style></style>
