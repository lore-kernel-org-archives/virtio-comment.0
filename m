Return-Path: <virtio-comment-return-3045-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 81576986508
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 May 2022 08:52:20 +0000 (UTC)
Message-ID: <a8d25c24-793a-b938-97c7-158708943d94@redhat.com>
Date: Wed, 18 May 2022 16:52:02 +0800
MIME-Version: 1.0
References: <20220516103256.896922-1-alvaro.karsz@solid-run.com>
 <YoJxfLJLwn28i+Pz@stefanha-x1.localdomain>
 <CAJs=3_D=yqKzCdWwW+CY93rzGZYJEZ5twKbYgLaKpgTSNv0WVw@mail.gmail.com>
 <YoNr0jTiqtW8XYDX@stefanha-x1.localdomain>
 <CAJs=3_DudKej_CxdtVDsc_ePJEEr24fQv3uS-XWDCZ8OzRxMBQ@mail.gmail.com>
 <YoOjkNqkqUhtEjuq@stefanha-x1.localdomain>
 <CAJs=3_BN_MbiU5-CP67=g0WJnCBpXW-9OCm-rMuUMOt3GuWWBQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJs=3_BN_MbiU5-CP67=g0WJnCBpXW-9OCm-rMuUMOt3GuWWBQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH v2] Introduction of Virtio Network device
 notifications coalescing feature
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Alvaro Karsz <alvaro.karsz@solid-run.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Rabeeh Khoury <rabeeh@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2022/5/17 23:50, Alvaro Karsz =E5=86=99=E9=81=93:
>> This reasoning applies to rx but not tx. It would be fine to disable the
>> timer since the driver controls tx buffer submission.


The driver is required to some post processing after a packet has been sent=
.

A well behaved driver should rely somehow on the tx interrupt. It can=20
provide the accounting timely which may help for the TCP performance.


> I'm not sure I understand why this can't happen in TX.
> Assume the following situation:
> tx-max-frames is 10.
> The driver wants to send 5 packets (ideal case, every packet is small
> enough to fit in one buffer), then no more packets to send for a long
> time.
>
> If event suppression isn't on, the driver won't know that the
> descriptors were used by device, since the device won't interrupt the
> driver.
> I'm assuming that the driver won't check the descriptor flags without
> being interrupted, which seems like a "good" behaviour when event
> suppression isn't on.
>
> Am I missing something?


Maybe we can say the driver should not disable timer.

Thanks


>
>
> Alvaro
>


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

