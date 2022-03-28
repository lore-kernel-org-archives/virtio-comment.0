Return-Path: <virtio-comment-return-2863-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 654BC986269
	for <virtio-comment@lists.oasis-open.org>; Mon, 28 Mar 2022 11:14:56 +0000 (UTC)
MIME-Version: 1.0
References: <1645101080313.3853@amazon.com> <20220217125506.icgvndy3v66cyhxy@sgarzare-redhat>
 <0420e5d6-60f0-be57-ec6a-e88127174cda@gmail.com> <1645519589258.8467@amazon.com>
 <20220223085725.22vwp72qo7m6noq7@sgarzare-redhat> <1645623537015.64403@amazon.com>
 <1647943078836.86626@amazon.com>
In-Reply-To: <1647943078836.86626@amazon.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 28 Mar 2022 13:14:40 +0200
Message-ID: <CAGxU2F5m3ZTV8FBVM_Tq5wV1sWxUBjxmsda-BcjCVf7EFcy-DA@mail.gmail.com>
Subject: Re: [virtio-comment] vsock: define a maximum size for the packet data
Content-Type: text/plain; charset="UTF-8"
To: "Loghin, Laura" <lauralg@amazon.com>
Cc: Arseniy Krasnov <oxffffaa@gmail.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Mar 22, 2022 at 10:58 AM Loghin, Laura <lauralg@amazon.com> wrote:
>
> Hi,
>
> Sorry for the super late reply! I just sent the patch for the `len` description [1].
>
> Regarding the max size for the packet data, the proposal for adding a field in the config space sounds good to me. What would be some next steps here? Should I send a patch for this one as well?

Yes, please.

> From what I understand, we would define a new feature for the max size, and
> add a new field in the config space. Did I misunderstand it?

That's what I would do :-)
When the feature is negotiated, then the driver should not send
packets and allocate RX buffers larger than that size.

Thanks,
Stefano


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

