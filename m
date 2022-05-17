Return-Path: <virtio-comment-return-3044-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62806986505
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 May 2022 15:51:13 +0000 (UTC)
MIME-Version: 1.0
References: <20220516103256.896922-1-alvaro.karsz@solid-run.com>
 <YoJxfLJLwn28i+Pz@stefanha-x1.localdomain> <CAJs=3_D=yqKzCdWwW+CY93rzGZYJEZ5twKbYgLaKpgTSNv0WVw@mail.gmail.com>
 <YoNr0jTiqtW8XYDX@stefanha-x1.localdomain> <CAJs=3_DudKej_CxdtVDsc_ePJEEr24fQv3uS-XWDCZ8OzRxMBQ@mail.gmail.com>
 <YoOjkNqkqUhtEjuq@stefanha-x1.localdomain>
In-Reply-To: <YoOjkNqkqUhtEjuq@stefanha-x1.localdomain>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Tue, 17 May 2022 18:50:36 +0300
Message-ID: <CAJs=3_BN_MbiU5-CP67=g0WJnCBpXW-9OCm-rMuUMOt3GuWWBQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v2] Introduction of Virtio Network device
 notifications coalescing feature
Content-Type: text/plain; charset="UTF-8"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> This reasoning applies to rx but not tx. It would be fine to disable the
> timer since the driver controls tx buffer submission.

I'm not sure I understand why this can't happen in TX.
Assume the following situation:
tx-max-frames is 10.
The driver wants to send 5 packets (ideal case, every packet is small
enough to fit in one buffer), then no more packets to send for a long
time.

If event suppression isn't on, the driver won't know that the
descriptors were used by device, since the device won't interrupt the
driver.
I'm assuming that the driver won't check the descriptor flags without
being interrupted, which seems like a "good" behaviour when event
suppression isn't on.

Am I missing something?


Alvaro

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

