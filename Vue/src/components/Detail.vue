<template>
  <div>
    <table class="table table-bordered w-50">
      <tr>
        <th>번호</th>
        <td>{{ no }}</td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td>{{ writer }}</td>
      </tr>
      <tr>
        <th>제목</th>
        <td>{{ title }}</td>
      </tr>
      <tr>
        <th>날짜</th>
        <td>{{ getFormatDate(regtime) }}</td>
      </tr>
      <tr>
        <td colspan="2">
          {{ content }}
        </td>
      </tr>
    </table>

    <br />
    <div class="text-center">
      <router-link to="/list"
        ><button class="btn btn-warning">답변</button></router-link
      >
      <router-link to="/list"
        ><button class="btn btn-primary">목록</button></router-link
      >
      <router-link :to="'/update?no=' + no"
        ><button class="btn btn-primary">수정</button></router-link
      >
      <router-link :to="'/delete?no=' + no"
        ><button class="btn btn-primary">삭제</button></router-link
      >
    </div>
  </div>
</template>

<script>
import moment from 'moment';
export default {
  name: 'detail',
  props: {
    no: { type: Number },
    writer: { type: String },
    title: { type: String },
    content: { type: String },
    regtime: { type: String },
  },
  methods: {
    getFormatDate(regtime) {
      return moment(new Date(regtime)).format('YYYY.MM.DD HH:mm:ss');
    },
  },
};
</script>
