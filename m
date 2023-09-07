Return-Path: <virtio-comment-return-7279-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1730EE14DC
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Sep 2023 10:58:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 58A1A26A5B
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Sep 2023 10:58:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B2E49865F7
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Sep 2023 10:58:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 40472983EBE; Thu,  7 Sep 2023 10:58:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 330879865EB
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Sep 2023 10:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0vzkYb_KMWyd80jbsw8Q5w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694084315; x=1694689115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDMPSTiyX4uio8/2UERgYmV0iBMoK74NucAAoMtKU1c=;
        b=mFveMAENRD2iz1mmv+Kzbw0N17M9eRKRL59Jtsntx2bPl+dNm/VOYQgUFGJZVkGCLE
         rl5kyPkyE6VQWS72CYGRt/e+iNv3NeFQOev73wa5gXtzh4QMCGA/3TGGnDKTFaDu6kJv
         aQC6z4uwcZk5sVJoy9W3H7TwzQ7SWT5OR/bXxObgjsTh/RW3eDy7wsKkctHC/S5Mz8dr
         CxsVfz/n904GoR8LNl6iQbkYmTx73f20Lh8f0pX/Afl0eQiBbuZf/WKRSXDFYkyYx2aO
         58Fbr8Yk073gzsdJs8UCkDWUzebz34/z6O6IXf+5WedqOidZmDeM4x0Z1FYsk+K30w3r
         4prQ==
X-Gm-Message-State: AOJu0YwzvqXia1z6465az6O5+7Ydpt1lI7Ao/pjX1JfERsMhrnxpP2O6
	qmpEPpL6ekiqCA8+IzuL0uUNM5HdNVFrPchmyixd+dckCpEZTyd6svxsQMgaYz45jRwEa2T6g0o
	ciiWlRdqIBXANUXoXsE0nH9/QTNjUOXfiVbEjbhbXz6mMhCOs9w==
X-Received: by 2002:a25:a1e9:0:b0:d74:6c9f:e734 with SMTP id a96-20020a25a1e9000000b00d746c9fe734mr20591956ybi.47.1694084315049;
        Thu, 07 Sep 2023 03:58:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN73Q9CncBznilZcGcVajBf+X8TTJfKz2vYXUE+u6SqXOGXc5B9FbqHO52n4VlBtZuS7xiCRjznGd/G/gG9Zc=
X-Received: by 2002:a25:a1e9:0:b0:d74:6c9f:e734 with SMTP id
 a96-20020a25a1e9000000b00d746c9fe734mr20591941ybi.47.1694084314752; Thu, 07
 Sep 2023 03:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906042851-mutt-send-email-mst@kernel.org> <aa6101cc-caf6-95e9-89cd-614ac7a43e55@intel.com>
 <20230906094742-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230906094742-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 7 Sep 2023 12:57:58 +0200
Message-ID: <CAJaqyWfccvVwcbg4Sg7RbRd851+C+FzF0tvDmO6Vrt2TmwsehQ@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, jasowang@redhat.com, cohuck@redhat.com, 
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org, 
	virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 0/5] virtio: introduce SUSPEND bit and vq state

On Wed, Sep 6, 2023 at 3:49=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Wed, Sep 06, 2023 at 04:38:44PM +0800, Zhu, Lingshan wrote:
> >
> >
> > On 9/6/2023 4:29 PM, Michael S. Tsirkin wrote:
> > > On Wed, Sep 06, 2023 at 04:16:32PM +0800, Zhu Lingshan wrote:
> > > > This series introduces
> > > > 1)a new SUSPEND bit in the device status
> > > > Which is used to suspend the device, so that the device states
> > > > and virtqueue states are stabilized.
> > > >
> > > > 2)virtqueue state and its accessor, to get and set last_avail_idx
> > > > and last_used_idx of virtqueues.
> > > >
> > > > The main usecase of these new facilities is Live Migration.
> > > >
> > > > Future work: dirty page tracking and in-flight descriptors.
> > > oh that answers my question - it's not covered.
> > > I don't think we can merge this without in-flight descriptor
> > > support.
> > When SUSPEND, we require the device wait until all descriptors that
> > being processed to finish and mark them as used.(In patch 2)
> > at this point there may be no in-flight descriptors, so this is still
> > self-consistent. The tracker for in-flight descriptors is excluded to
> > make this series small and focus.
>
> Does not work generally.
> Imagine RX ring of a network device for example. You can wait
> as long as you can but if there's no incoming network traffic
> buffers will not be used.
>

The patch should word it differently, yes.

QEMU's vhost-kernel net handler currently assumes the device will use
the descriptors sequentially from avail_idx. In that case, it is
possible to simply finish receiving in-flight packets (not buffers)
and just stop receiving new packets. As all packets has been received,
we have a valid used-idx, and the device at resume (or the destination
device at migration) can just fetch all buffers from there.

I may have a better wording of this in other mails.

Would it work to use this solution with in_order, and defer the
inflight buffers handling for the future? It would allow to keep this
series small.

Thanks!

> Also please, keep to the spec terminology. buffers are used not
> descriptors. Best to keep it straight errors will not leak into
> spec.
>
>
> > >
> > >
> > >
> > > > This series addresses many comments from Jason, Stefan and Eugenio
> > > > from RFC series.
> > > >
> > > > Zhu Lingshan (5):
> > > >    virtio: introduce vq state as basic facility
> > > >    virtio: introduce SUSPEND bit in device status
> > > >    virtqueue: constraints for virtqueue state
> > > >    virtqueue: ignore resetting vqs when SUSPEND
> > > >    virtio-pci: implement VIRTIO_F_QUEUE_STATE
> > > >
> > > >   content.tex       | 118 +++++++++++++++++++++++++++++++++++++++++=
+++++
> > > >   transport-pci.tex |  18 +++++++
> > > >   2 files changed, 136 insertions(+)
> > > >
> > > > --
> > > > 2.35.3
> > > >
> > > >
> > > > This publicly archived list offers a means to provide input to the
> > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > >
> > > > In order to verify user consent to the Feedback License terms and
> > > > to minimize spam in the list archive, subscription is required
> > > > before posting.
> > > >
> > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mai=
ling-lists
> > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > Join OASIS: https://www.oasis-open.org/join/
> > > >
>


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

