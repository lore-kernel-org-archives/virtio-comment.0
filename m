Return-Path: <virtio-comment-return-8271-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4178FC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:47:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 840EB2A8FA
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:47:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5B5B5986CAE
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:47:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 44D01986CAA; Wed,  8 Nov 2023 17:47:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 354D4986CAB
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 17:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Ye25h1QFNCKAC7f_IcAkTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699465619; x=1700070419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYzxyEpUFSbYX7G453X4PxItlnZAgDkb6zs77EyaWO4=;
        b=lKy49KpOShA97JQvAWLYSAS2xl69pXz8LZvC3i2khUwDS27TSyqsvQlcXeid0tLhyv
         GuYuVICvZ2G9VjfWilihE+uemk34soGG0ptFqQRoQJTYL+MatVz5deqyc0pgOMByckoB
         vbHZYsNhj03JJA31lLtgLi6w7mEcQorY3U4Cn5QrF21tLTVZI8MznT+5nIH522fwn2i+
         Jv9rQMILnR6+4tE1XatL3pgG6xgsy/+8Dz9IpeGOO8Idf/Y7iK20uqyMmv0hCZDWAwI/
         yW4SSpywiFC5c8ehFiQMM9lMn/9gtOLv9YcBNk0BvvTl5352BXf/cORUTQ8xcwhJH73l
         ju3g==
X-Gm-Message-State: AOJu0Yym0+O5tBL7Yuq0za2+MAfdi2/a4XY/o+FUbkvdGWSvddYrNOQN
	FoeYxQ9YKtAexMXhIITCnc2vde0cDlI9VZnhyhkTxBMoBkWLXSg4L+GF3NLCqSq6jUI/F3cABcK
	4G/Voj+PBRz5OWo5oVxXeCy6EI5/1CUsC7g==
X-Received: by 2002:ac2:4e88:0:b0:509:4a02:49f6 with SMTP id o8-20020ac24e88000000b005094a0249f6mr1743992lfr.34.1699465619585;
        Wed, 08 Nov 2023 09:46:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy1mxuVc29+KZ4azAZsfYWZadiNT/TuKullB5PWYZbw7z+Ekr+8B5nNuFMR2h744ltBjttOA==
X-Received: by 2002:ac2:4e88:0:b0:509:4a02:49f6 with SMTP id o8-20020ac24e88000000b005094a0249f6mr1743983lfr.34.1699465619247;
        Wed, 08 Nov 2023 09:46:59 -0800 (PST)
Date: Wed, 8 Nov 2023 12:46:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231108124625-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-4-lingshan.zhu@intel.com>
 <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
MIME-Version: 1.0
In-Reply-To: <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

On Tue, Nov 07, 2023 at 05:27:23PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/6/2023 5:49 PM, Michael S. Tsirkin wrote:
> > On Fri, Nov 03, 2023 at 06:34:34PM +0800, Zhu Lingshan wrote:
> > > When SUSPEND is set, device states and virtqueue states
> > > should be stablized, therefore the driver should not
> > > reset vqs when SUSPEND is set in device status.
> > > 
> > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > ---
> > >   content.tex | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/content.tex b/content.tex
> > > index bcc9d4b..060b5c2 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -444,6 +444,9 @@ \subsubsection{Virtqueue Reset}\label{sec:Basic Facilities of a Virtio Device /
> > >   The device MUST reset any state of a virtqueue to the default state,
> > >   including the available state and the used state.
> > > +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in \field{device status},
> > > +the driver SHOULD NOT reset any virtqueues.
> > > +
> > >   \drivernormative{\paragraph}{Virtqueue Reset}{Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
> > >   After the driver tells the device to reset a queue, the driver MUST verify that
> > Seems somewhat arbitrary and breaks the claim that the
> > feature is orthogonal and can have uses besides migration.
> when suspended, the device is frozen.
> The driver is aware of this process and so should not reset the vqs I think.

Again that is only true because you want to use it for migration.
But then you can't claim it's a generic facility.

> > 
> > 
> > 
> > > -- 
> > > 2.35.3


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

