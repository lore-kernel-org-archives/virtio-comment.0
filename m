Return-Path: <virtio-comment-return-3131-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1F0A9862B8
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Jun 2022 09:44:06 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220616123431-mutt-send-email-mst@kernel.org>
References: <20220613104038.22010-1-lauralg@amazon.com>
 <20220614135734.534dbc0b.pasic@linux.ibm.com>
 <20220616123431-mutt-send-email-mst@kernel.org>
Date: Mon, 20 Jun 2022 11:43:57 +0200
Message-ID: <87v8svr7oi.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v4] virtio-vsock: add max payload size
 config field
Content-Type: text/plain
To: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Cc: Laura Loghin <lauralg@amazon.com>, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jun 16 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Jun 14, 2022 at 01:57:34PM +0200, Halil Pasic wrote:
>> On Mon, 13 Jun 2022 13:40:38 +0300
>> Laura Loghin <lauralg@amazon.com> wrote:
>> 
>> > @@ -57,6 +62,25 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>> >  \hline
>> >  \end{tabular}
>> >  
>> > +The following driver-read-only field, \field{data_max_size} only exists if
>> > +VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the maximum packet payload
>> > +size for the driver to use.
>> > +
>> > +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> > +
>> > +The device MUST NOT change the value exposed through \field{data_max_size}.
>> > +
>> > +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
>> > +
>> > +A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device offers it.
>> > +
>> > +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, the receive buffers it
>> > +supplies for a packet MUST have a total size that doesn't exceed the size
>> > +\field{data_max_size} (plus header length).
>> > +
>> > +If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST  NOT transmit packets
>> > +of size exceeding the value of \field{data_max_size} (plus header length).
>> > +
>> 
>> Hi and sorry for being late to the party!
>> 
>> I believe I do understand why do we want to put a restriction on the
>> size of the transmitted packets, but I would appreciate if you could
>> explain to me why do we want to limit the receive buffer size.
>> 
>> Also I find the wording regarding a little bit ambiguous because
>> in a networking context it also makes sense to talk about the size of the
>> receive buffer. I guess hear we are talking about a single virtio buffer
>> (a descriptor chain described potentially non-continuous (or compact in
>> the mathematical sense of the word) which is composed from as many
>> continuous chunks of memory as many descriptors are contained within the
>> descriptor chain). If we are indeed talking about a single virtio buffer,
>> I don't understand the plural. If not, I'm not sure what are we talking
>> about.
>
> I think I agree here, I don't understand the mix of "buffers" and "a
> packet" either.
>
> I voted "no" on the ballot, though if others feel we should apply as
> is and fix up later, that is not too bad.

I now switched to "no" as well; it's not too bad to fix things later,
but it would be good if we had a common understanding before the change
goes in.


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

