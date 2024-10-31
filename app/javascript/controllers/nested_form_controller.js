// import { Controller } from '@hotwired/stimulus';

// export default class extends Controller {
//   static targets = ['template', 'container'];
//   connect() {
//     console.log('NestedFormController connected');
//   }

//   add(event) {
//     console.log('Add method called');

//     event.preventDefault();
//     const content = this.templateTarget.innerHTML.replace(
//       /NEW_RECORD/g,
//       new Date().getTime(),
//     );
//     this.containerTarget.insertAdjacentHTML('beforeend', content);
//   }

//   remove(event) {
//     console.log('Remove method called');

//     event.preventDefault();
//     const item = event.target.closest('.nested-fields');
//     if (item.dataset.newRecord == 'true') {
//       item.remove();
//     } else {
//       item.style.display = 'none';
//       item.querySelector("input[name*='_destroy']").value = 1;
//     }
//   }
// }
