Return-Path: <virtio-comment-return-2768-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E14B3986413
	for <virtio-comment@lists.oasis-open.org>; Wed, 23 Feb 2022 08:57:32 +0000 (UTC)
Date: Wed, 23 Feb 2022 09:57:25 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20220223085725.22vwp72qo7m6noq7@sgarzare-redhat>
References: <1645101080313.3853@amazon.com>
 <20220217125506.icgvndy3v66cyhxy@sgarzare-redhat>
 <0420e5d6-60f0-be57-ec6a-e88127174cda@gmail.com>
 <1645519589258.8467@amazon.com>
MIME-Version: 1.0
In-Reply-To: <1645519589258.8467@amazon.com>
Subject: Re: [virtio-comment] vsock: define a maximum size for the packet data
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: "Loghin, Laura" <lauralg@amazon.com>
Cc: Arseniy Krasnov <oxffffaa@gmail.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Feb 22, 2022 at 08:46:29AM +0000, Loghin, Laura wrote:
>
>Hello,
>
>I was thinking that this limit would be used on the TX path (because on 
>the RX, the device is considered to be trusted it will add a shorter 
>buffer). The size of the TX buffer would still be the one from the 
>header or from its descriptor (this is another thing that I think 
>should be explicitly mentioned in the spec even though it's pretty 
>obvious; there is no mention at this moment about what `len` is). The 

The size of the TX buffers should be the one from the descriptor. (Now 
we are using 2 buffers, one for the header and one for the payload, but 
it is an implementation details).

Then the `len` field in the header contains the amount of bytes used for 
the payload. So the buffer could be bigger then (hdr + payload).

For TX in the current implementation it never happens because of the way 
the Linux driver is written, but for RX it happens just this, because 
the driver allocates the buffer and the device can use only a part of 
it.

However I agree that we could describe the `len` field better in the 
specs, also because it's currently not really described.

If you want to send a patch, that would be great!

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

