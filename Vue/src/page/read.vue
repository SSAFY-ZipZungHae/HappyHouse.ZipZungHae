<template>
  <div>
    <detail
      :content="item.content"
      :title="item.title"
      :writer="item.writer"
      :regtime="item.regtime"
      :no="item.no"
    />
  </div>
</template>

<script>
import http from '@/util/http-common';
import Detail from '@/components/Detail.vue';
export default {
  name: 'read',
  components: {
    Detail,
  },
  data: function() {
    return {
      item: {},
    };
  },
  created() {
    http.get(`/board/${this.$route.query.no}`).then(({ data }) => {
      this.item = data;
      console.dir(data);
    });
  },
};
</script>

<style></style>
