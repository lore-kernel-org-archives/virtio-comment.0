Return-Path: virtio-comment-return-1358-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E752985D51
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Jul 2020 15:28:23 +0000 (UTC)
MIME-Version: 1.0
From: Olivier Delande <olivier.delande@gmail.com>
Date: Wed, 22 Jul 2020 17:28:01 +0200
Message-ID: <CANkLV9gVFGJj=wV_jJR4DBfw9xF2ZVVN+fr2qr0A0j==Q5pJCw@mail.gmail.com>
Subject: [virtio-comment] Suggested improvement for virtq_need_event
Content-Type: text/plain; charset="UTF-8"
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

In virtio_queue.h, virtq_need_event is implemented as

  static inline int virtq_need_event(uint16_t event_idx, uint16_t
new_idx, uint16_t old_idx)
  {
      return (uint16_t)(new_idx - event_idx - 1) < (uint16_t)(new_idx
- old_idx);
  }

. Wouldn't the equivalent

  static inline int virtq_need_event(uint16_t event_idx, uint16_t
new_idx, uint16_t old_idx)
  {
      return (uint16_t)(event_idx - old_idx) < (uint16_t)(new_idx - old_idx);
  }

be more readable/intuitive (and possibly slightly faster and more compact)?

Apologies for bikeshedding!

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

