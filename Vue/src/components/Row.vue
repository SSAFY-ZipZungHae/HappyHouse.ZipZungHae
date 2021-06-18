<template>
  <tr>
    <td>{{ no }}</td>
    <td>
      <router-link :to="`/read?no=${no}`">{{ title }}</router-link>
    </td>
    <td>{{ writer }}</td>
    <td>{{ getFormatDate(regtime) }}</td>
  </tr>
</template>

<script>
import moment from 'moment';
export default {
  name: 'row',
  props: {
    no: { type: Number },
    writer: { type: String },
    title: { type: String },
    regtime: { type: String },
  },
  methods: {
    getFormatDate(regtime) {
      return moment(new Date(regtime)).format('YYYY.MM.DD');
    },
  },
};
</script>
