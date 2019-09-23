Return-Path: virtio-comment-return-850-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFD6F985A54
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Sep 2019 16:16:23 +0000 (UTC)
MIME-Version: 1.0
References: <20190917071812.529-1-eperezma@redhat.com> <20190918102431.GH26027@stefanha-x1.localdomain>
In-Reply-To: <20190918102431.GH26027@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 23 Sep 2019 18:15:45 +0200
Message-ID: <CAJaqyWcuydn8xqjh4Xb+1g8sGCSV=Y30NAaLXXkpEuDwbw99Qw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH] block: Add multiqueue
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

You are right, I understood it as mandatory.

Version 2 of the patch sent.

Thanks!

On Wed, Sep 18, 2019 at 12:24 PM Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
>
> On Tue, Sep 17, 2019 at 09:18:12AM +0200, Eugenio P=C3=A9rez wrote:
> > @@ -3973,6 +3984,11 @@ \subsection{Device Initialization}\label{sec:Dev=
ice Types / Block Device / Devic
> >      \field{max_write_zeroes_sectors} and \field{max_write_zeroes_seg} =
can
> >      be read to determine the maximum write zeroes sectors and maximum
> >      number of write zeroes segments for the block driver to use.
> > +
> > +\item If the VIRTIO_BLK_F_MQ feature is negotiated, \field{num_queues}=
 field
> > +    can be read to determine the number of queues. The driver does not=
 use more
> > +    queues than guest's number of CPUs.
>
> Why state that "the driver does not use more queues than guest's number
> of CPUs"?  This seems like an implementation detail and it's up to the
> driver author to decide the most effective way of using multiqueue.

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

