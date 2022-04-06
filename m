Return-Path: <virtio-comment-return-2911-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C3D79864DC
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Apr 2022 07:42:20 +0000 (UTC)
MIME-Version: 1.0
References: <1645101080313.3853@amazon.com> <20220217125506.icgvndy3v66cyhxy@sgarzare-redhat>
 <0420e5d6-60f0-be57-ec6a-e88127174cda@gmail.com> <1645519589258.8467@amazon.com>
 <20220223085725.22vwp72qo7m6noq7@sgarzare-redhat> <1645623537015.64403@amazon.com>
 <1647943078836.86626@amazon.com> <CAGxU2F5m3ZTV8FBVM_Tq5wV1sWxUBjxmsda-BcjCVf7EFcy-DA@mail.gmail.com>
 <29c47acc-b9fe-2787-3fae-52e666a54955@amazon.com>
In-Reply-To: <29c47acc-b9fe-2787-3fae-52e666a54955@amazon.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 6 Apr 2022 09:42:00 +0200
Message-ID: <CAGxU2F6NMCxwTAbnLA_zZjSxrLJEr32iM2oNBxebEFe1U+JtEA@mail.gmail.com>
Subject: Re: [virtio-comment] vsock: define a maximum size for the packet data
Content-Type: text/plain; charset="UTF-8"
To: Laura Loghin <lauralg@amazon.com>
Cc: Arseniy Krasnov <oxffffaa@gmail.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Apr 4, 2022 at 3:55 PM Laura Loghin <lauralg@amazon.com> wrote:
>
> On 3/28/22 14:14, Stefano Garzarella wrote:
>
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
> On Tue, Mar 22, 2022 at 10:58 AM Loghin, Laura <lauralg@amazon.com> wrote:
>
> Hi,
>
> Sorry for the super late reply! I just sent the patch for the `len` description [1].
>
> Regarding the max size for the packet data, the proposal for adding a field in the config space sounds good to me. What would be some next steps here? Should I send a patch for this one as well?
>
> Yes, please.
>
> From what I understand, we would define a new feature for the max size, and
> add a new field in the config space. Did I misunderstand it?
>
> That's what I would do :-)
> When the feature is negotiated, then the driver should not send
> packets and allocate RX buffers larger than that size.
>
> Thanks,
> Stefano
>
> Hi,
>
> I just sent a patch for the max size config field: https://lists.oasis-open.org/archives/virtio-comment/202204/msg00010.html.

Great! I'll review in the next few days.

> It mostly follows the spec format for MTU. For the max value I used for now the one defined in linux, but should we actually go with a higher one?

Maybe yes, but having the same default value as the current one maybe
simplifies the driver/device for backward compatibility?
Let's discuss it on the patch.

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

