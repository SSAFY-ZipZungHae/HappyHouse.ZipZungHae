<template>
  <div>삭제중...</div>
</template>

<script>
import http from '@/util/http-common';
export default {
  name: 'delete',
  created() {
    http
      .delete(`/board/${this.$route.query.no}`)
      .then(({ data }) => {
        let msg = '삭제 처리시 문제가 발생했습니다.';
        if (data === 'success') {
          msg = '삭제가 완료되었습니다.';
        }
        alert(msg);
        this.$router.push('/list');
      })
      .catch(() => {
        alert('삭제 처리시 에러가 발생했습니다.');
      });
  },
};
</script>

<style></style>
