Return-Path: <virtio-comment-return-4675-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A9BC7EE2F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8EC743E33E
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 862569867A8
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7DFA59867A1; Fri,  3 Mar 2023 13:37:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-Id: <virtio-comment.lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6BA629867A2
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Mar 2023 13:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: IANXFcxLOySYY2JM9BAn0w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL9dIB/gsontD6h1QVe0P/0nUs0X8xufj9Z6cax67ig=;
        b=D/94nW2Pb0S2hJBS2xc5tuI+VSS3IXb+RbipT5LzeMrLY/uFUb7S/90RjdZOjM8Uc1
         BLnrNI1PgTvHoaoSP1+yZ7PLortN0zzO9AxO+Tp6+UtzozS9pNDr15UjihO6snr2EbXw
         EE0xng8f8q/4LkIKKSGFu0zbPJny9pyq++NF/LDCJYMUUZIxybCbtV9JE0BC97EKgm2P
         N/Ilr5ReQF+dMUQsOiRwWTRUg8rb1Z9YKTlvjt4mQpzPaBREKKieOukRY4a2wJFtCW61
         uTwndyq+MfWg0DjQP/l4TJmXXnyR7uHPOHbc5JxE3agK3mFlfGk01Zlsy8XxkyjlFPmp
         C1ug==
X-Gm-Message-State: AO0yUKXT8btiy8u/y1y40YQ9ZLeC7ajwgK3ud+RX8WKmpiUh1OUnQiYw
	QM5z3PZEOIbjIsjk5/+UavBaTT4D4anW2KF1MuEn7jegwXKBKdHrzUTUTe9BSH2gqLS5RwevFV/
	rWPD7t6N8QLWg+qCge6hdkvRrOgANtvYm4Q==
X-Received: by 2002:a05:600c:46c6:b0:3eb:3cc9:9f85 with SMTP id q6-20020a05600c46c600b003eb3cc99f85mr1807203wmo.26.1677850655465;
        Fri, 03 Mar 2023 05:37:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+kEGATXEUz0uZe6OTuCQPi/14kOFv1PTZoGtbtz6n3UFjdjR1nTgr0hRgdzmknW4mZYJ5KuQ==
X-Received: by 2002:a05:600c:46c6:b0:3eb:3cc9:9f85 with SMTP id q6-20020a05600c46c600b003eb3cc99f85mr1807173wmo.26.1677850655143;
        Fri, 03 Mar 2023 05:37:35 -0800 (PST)
Date: Fri, 3 Mar 2023 08:37:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230303083213-mutt-send-email-mst@kernel.org>
References: <cover.1677761896.git.mst@redhat.com>
 <20c81b66f0b21b5bd646c24840ac3f8462c86acf.1677761896.git.mst@redhat.com>
 <20230302204007.GD2554028@fedora>
 <20230302190230-mutt-send-email-mst@kernel.org>
 <20230303132840.GC2866370@fedora>
MIME-Version: 1.0
In-Reply-To: <20230303132840.GC2866370@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v10 04/10] admin: introduce virtio admin virtqueues

On Fri, Mar 03, 2023 at 08:28:40AM -0500, Stefan Hajnoczi wrote:
> On Thu, Mar 02, 2023 at 07:05:14PM -0500, Michael S. Tsirkin wrote:
> > On Thu, Mar 02, 2023 at 03:40:07PM -0500, Stefan Hajnoczi wrote:
> > > On Thu, Mar 02, 2023 at 08:05:06AM -0500, Michael S. Tsirkin wrote:
> > > > The admin virtqueues will be the first interface to issue admin commands.
> > > > 
> > > > Currently virtio specification defines control virtqueue to manipulate
> > > > features and configuration of the device it operates on. However,
> > > > control virtqueue commands are device type specific, which makes it very
> > > > difficult to extend for device agnostic commands.
> > > > 
> > > > To support this requirement in a more generic way, this patch introduces
> > > > a new admin virtqueue interface.
> > > 
> > > Is this referring to the existing virtio-net, virtio-scsi, etc control
> > > virtqueues?
> > > 
> > > I see the admin virtqueue as the virtqueue equivalent to transport
> > > feature bits. The admin queue does nothing device type-specific (net,
> > > scsi, etc) and instead focusses on transport and core virtio tasks.
> > > 
> > > Keeping the device-specific virtqueue separate from the admin virtqueue
> > > is simpler and has fewer potential problems. I don't think creating
> > > common infrastructure for device-specific control virtqueues across
> > > device types worthwhile or within the scope of this patch series.
> > 
> > yes this commit log is outdated. referred to original
> > proposal by Max which also planned to replace cvq.
> > will update.
> > 
> > 
> > > > We also support more than one admin virtqueue, for QoS and
> > > > scalability requirements.
> > > > 
> > > > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  admin.tex   | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > >  content.tex |  7 +++--
> > > >  2 files changed, 79 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/admin.tex b/admin.tex
> > > > index 7e28b77..3ffac2e 100644
> > > > --- a/admin.tex
> > > > +++ b/admin.tex
> > > > @@ -155,3 +155,77 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
> > > >  \field{command_specific_data} and \field{command_specific_result}
> > > >  depends on these structures and is described separately or is
> > > >  implicit in the structure description.
> > > > +
> > > > +\section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Administration Virtqueues}
> > > > +
> > > > +An administration virtqueue of an owner device is used to submit
> > > > +group administration commands. An owner device can have more
> > > > +than one administration virtqueue.
> > > > +
> > > > +If VIRTIO_F_ADMIN_VQ has been negotiated, an owner device exposes one
> > > > +or more adminstration virtqueues. The number and locations of the
> > > > +administration virtqueues are exposed by the owner device in a transport
> > > > +specific manner.
> > > > +
> > > > +The driver submits commands by queueing them to an arbitrary
> > > > +administration virtqueue, and they are processed by the
> > > > +device in the order in which they are queued. It is the
> > > > +responsibility of the driver to ensure ordering for commands
> > > > +placed on different administration virtqueues, because they will
> > > > +be executed with no order constraints.
> > > 
> > > Does "they are processed by the device in the order in which they are
> > > queued" mean only 1 admin command can be running at any given time and
> > > therefore they will complete in order? This would allow pipelining
> > > dependent commands but prevent long-running commands because the
> > > virtqueue is blocked while executing a command.
> > 
> > we have multiple vqs for that.
> 
> This reminds me of the async challenges with QEMU's QMP monitor.
> 
> Will it ever be possible to abort an in-flight command? I guess the
> abort command would need to be submitted on another virtqueue, but how
> do you identify the in-flight command that you wish to cancel?
> 
> Please clarify the blocking semantics in the spec because it wasn't
> clear to me.
> 
> Thanks,
> Stefan

I don't really get what does "blocking" mean. Nothing is required to
block I think.
I guess for abort it is still in order but a different vq
should not be needed.

Maybe we can use ID of buffer to cancel commands?

1. driver submits command as ID = 1
2. driver submits abort as ID 2
3. device sees the abort and cancels ID 2
4. device uses buffer 1
5. device uses buffer 3 - abort is complete

Device gets commands and processes them in order. It's just like scsi:
multiple queues, if you break it you get to keep both pieces.

-- 
MST


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

