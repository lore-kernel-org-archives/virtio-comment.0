Return-Path: <virtio-comment-return-5337-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDCFC76196
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 13:22:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ACE6F2AD55
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 13:22:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9FD27986371
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 13:22:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9668B9862A5; Mon, 10 Apr 2023 13:22:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86F6E986319
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Apr 2023 13:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wxDeav0kM7yRlhXJRDlDPw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681132970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FHs05b8mKtgMV0ZlQi1Xu7fT2iRbGl0g/25OA1SBxs=;
        b=ty/Cbzwub8VQxLDRjqlnl52UBGoCQeZLQSpvNKxZg4644vpAgrHAq86H64cS7qnbTj
         4AULkERNHT7OwJtimVFzz1nSBFiPgJGOn2TtJODo/xHMaAr6M+WmH3jOJObkg/vTBd0x
         xcKwnnF/4trOsWIFNe7JyIJlrw5wCFDb+Hsb8Ri47fU8J6454YRfGMA2lXSGkobuVisd
         28OoYuC6FIkj2ICGquG1Alri5iVm15VqF7xN9IrngoHNPX/ptxQhR/ei7eipke0wsvfa
         Jn9B8BriEet51i38OA79cPj+vcFnX0Je71RofGEWeKn4m5vwUQH+0LfrrM7SBgWo7JR0
         6qlQ==
X-Gm-Message-State: AAQBX9f9ocLGoyFbMTjOK4duhSp/oHh7BcfjaA21Zb3aPR3x1Saltokv
	I0yaG7r2wSFB2z6iMJ5kkiiyTFluO6ENgD/k3eQslIcHz2/BQLa5glC5+HOTokoVcV/RRKQKtj3
	61iTkyeqNd+iGX5YKHWuTmKs7tviAArsqyA==
X-Received: by 2002:a5d:6d52:0:b0:2dc:c0da:409 with SMTP id k18-20020a5d6d52000000b002dcc0da0409mr6734057wri.27.1681132970727;
        Mon, 10 Apr 2023 06:22:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350be3DhnDYL4Fq1IRx8Eazh3xm1kpQS4Oh/emA6GK2rPD3Gx0n8M9zv4ubcRbC54VIPO3HAyoQ==
X-Received: by 2002:a5d:6d52:0:b0:2dc:c0da:409 with SMTP id k18-20020a5d6d52000000b002dcc0da0409mr6734037wri.27.1681132970425;
        Mon, 10 Apr 2023 06:22:50 -0700 (PDT)
Date: Mon, 10 Apr 2023 09:22:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
	stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com,
	hang.yuan@intel.com, virtio@lists.oasis-open.org,
	Jiri Pirko <jiri@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230410092104-mutt-send-email-mst@kernel.org>
References: <cover.1680533760.git.mst@redhat.com>
 <9cbecf20548a7adf4d97d07b17e40eb3c1c50209.1680533760.git.mst@redhat.com>
 <2ebedc33-1fa8-1fe5-67eb-8d657cf932db@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <2ebedc33-1fa8-1fe5-67eb-8d657cf932db@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v11 04/10] admin: introduce virtio admin virtqueues

On Thu, Apr 06, 2023 at 12:08:03AM -0400, Parav Pandit wrote:
> 
> 
> On 4/3/2023 11:03 AM, Michael S. Tsirkin wrote:
> > The admin virtqueues will be the first interface used to issue admin commands.
> > 
> The admin virtqueue
> 
> > Currently the virtio specification defines control virtqueue to manipulate
> > features and configuration of the device it operates on:
> > virtio-net, virtio-scsi, etc all have existing control virtqueues. However,
> > control virtqueue commands are device type specific, which makes it very
> > difficult to extend for device agnostic commands.
> > 
> > Keeping the device-specific virtqueue separate from the admin virtqueue
> > is simpler and has fewer potential problems.
> 
> > I don't think creating
> > common infrastructure for device-specific control virtqueues across
> > device types worthwhile or within the scope of this patch series.
> >  > To support this requirement in a more generic way, this patch introduces
> > a new admin virtqueue interface.
> > The admin virtqueue can be seen as the virtqueue analog to a transport.
> > The admin queue thus does nothing device type-specific (net, scsi, etc)
> > and instead focuses on transporting the admin commands.
> > 
> > We also support more than one admin virtqueue, for QoS and
> > scalability requirements.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > 
> > ---
> > explain ordering of commands as suggested by Stefan
> > dropped Max's S.O.B
> > reword commit log as suggested by David
> > minor wording fixes suggested by David
> > ---
> >   admin.tex   | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> >   content.tex |  7 +++--
> >   2 files changed, 80 insertions(+), 2 deletions(-)
> > 
> > diff --git a/admin.tex b/admin.tex
> > index c869a1a..f201bcd 100644
> > --- a/admin.tex
> > +++ b/admin.tex
> > @@ -182,3 +182,78 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
> >   \field{command_specific_data} and \field{command_specific_result}
> >   depends on these structures and is described separately or is
> >   implicit in the structure description.
> > +
> > +\section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Administration Virtqueues}
> > +
> > +An administration virtqueue of an owner device is used to submit
> > +group administration commands. An owner device can have more
> > +than one administration virtqueue.
> > +
> > +If VIRTIO_F_ADMIN_VQ has been negotiated, an owner device exposes one
> > +or more adminstration virtqueues. The number and locations of the
> > +administration virtqueues are exposed by the owner device in a transport
> > +specific manner.
> > +
> > +The driver queues requests to an arbitrary administration
> The driver enqueues

Not sure why - these are synonims - and this variant is more popular:

[mst@tuck virtio]$ git grep 'The driver queues'
admin.tex:The driver queues requests to an arbitrary administration
content.tex:The driver queues requests to the virtqueues, and they are used by
content.tex:The driver queues requests to an arbitrary request queue, and
virtio-gpio.tex:\item The driver queues \field{struct virtio_gpio_request} and
virtio-i2c.tex:The driver queues requests to the virtqueue, and they are used by the
virtio-vsock.tex:The driver queues outgoing packets on the tx virtqueue and incoming packet
[mst@tuck virtio]$ git grep 'The driver enqueues'
virtio-fs.tex:The driver enqueues normal requests on an arbitrary request queue. High


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

