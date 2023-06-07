Return-Path: <virtio-comment-return-6216-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2AEC77B7A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:47:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 495E03309B
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:47:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32E34986656
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:47:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1B922986243; Wed,  7 Jun 2023 09:47:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 09B8F98664F
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 09:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DDH6VSYnM4ma5OEwwsV75Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686131236; x=1688723236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL1kU2+6Lco3e2v/mHLP0z8EGus9TjPwUTfRM5aUUPY=;
        b=dCHWWjhlxbo2iBH3tSyxiLQryDjZ6x41su7e5iOG6TpDMM3Cn6ZUjx4qv/t0F+966G
         4kAX7BTw5+SBxcFsUo09qy+CEJPa91gwBpBPIxWRaJ7ZsVGLGMh8Vs3TZrHmKt8EAZyf
         Zyo22W2gyejJjZxOqncAMbCcFecJ5M+OdHrsLxqeSLOqmOumExoQQ+oFgeJ4ePnzrjPA
         nBFF0lyFtSwCdOJxJf4c7bMIdJLJlV4QyUEgABUEaFr8x84644ZQ0SAJKFpOlVeTNjdF
         KKs/UQFfQEt3OPo4soEYDU9pzak2WrVcPjuGk1L2w/gbszeOeAM259gNshJSj8NvH8dR
         styw==
X-Gm-Message-State: AC+VfDzmQb18vBon4nop5vOboz8AT234QSNHGdmE36XoGlGk1O6PP8uj
	RzHIk6RxWAv2+CycQ3Osies1eIirFRuH73gD7F/ZDExL6VtB2TsH1LvlLf9Rziw/TMYRmS+F+Zv
	4Nkps/WGAVNKTbPm4wTz2uzajsI89EkH7Ymlg6cEUqmVDRKYmcQ==
X-Received: by 2002:a25:9c47:0:b0:ba8:57c0:6e21 with SMTP id x7-20020a259c47000000b00ba857c06e21mr4409222ybo.56.1686131236533;
        Wed, 07 Jun 2023 02:47:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7CUEMnvVY6ayJjdpS6Nbk7hTFXN4ZKn2PE8RZKG+F6xd+qlxCI8c1uDMlzKxmDBpkYF5SnjPTRE5LFAURsjbU=
X-Received: by 2002:a25:9c47:0:b0:ba8:57c0:6e21 with SMTP id
 x7-20020a259c47000000b00ba857c06e21mr4409210ybo.56.1686131236266; Wed, 07 Jun
 2023 02:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606175511.2337208-3-eperezma@redhat.com>
 <20230606150327-mutt-send-email-mst@kernel.org> <CAJaqyWfpXcPn_Y_HF3bRHxCJCr5QPLS9e34AoBG1nr2-eK8Upw@mail.gmail.com>
 <20230607050112-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230607050112-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 7 Jun 2023 11:46:40 +0200
Message-ID: <CAJaqyWcf14UpTUt-LMBEbEA4=J+sdHAV2g+-dusT-ZzHV_8BZg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, alvaro.karsz@solid-run.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com, 
	Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, 
	si-wei.liu@oracle.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH 2/2] virtio: pci support virtqueue selective enabling

On Wed, Jun 7, 2023 at 11:03=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Jun 07, 2023 at 09:37:00AM +0200, Eugenio Perez Martin wrote:
> > On Tue, Jun 6, 2023 at 9:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Tue, Jun 06, 2023 at 07:55:11PM +0200, Eugenio P=C3=A9rez wrote:
> > > > Reusing virtqueue reset method to enabling a vq.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  transport-pci.tex | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/transport-pci.tex b/transport-pci.tex
> > > > index a5c6719..04c0429 100644
> > > > --- a/transport-pci.tex
> > > > +++ b/transport-pci.tex
> > > > @@ -375,6 +375,10 @@ \subsubsection{Common configuration structure =
layout}\label{sec:Virtio Transport
> > > >
> > > >  \item[\field{queue_enable}]
> > > >          The driver uses this to selectively prevent the device fro=
m executing requests from this virtqueue.
> > > > +        If the driver negotiates VIRTIO_F_RING_ENABLE_ANYTIME or
> > > > +        VIRTIO_F_RING_RESET, the driver writes 1 to this field to =
enable a
> > > > +        virtqueue.  See \ref{sec:Basic Facilities of a Virtio Devi=
ce / Virtqueues / Selective Virtqueue Enable}
> > > > +        and \ref{sec:Basic Facilities of a Virtio Device / Virtque=
ues / Virtqueue Reset}.
> > > >          1 - enabled; 0 - disabled.
> > >
> > > No, this is always used to enable queues even with no features.
> > >
> >
> > Yes. Now I see it is confusing if reading the spec and not the diff,
> > but my intention was to not modify the behavior without the feature
> > flags. Maybe there is a better way to achieve it.
>
> This is bad:
>
>  Driver always does X.
> +If Y then driver does Z.
>
>
> This is good:
>
> -Driver always does X.
> -If Y, then driver does Z, otherwise X.
>
> even though it's a bigger patch, but patch review is
> secondary to a readable spec.
>

I agree, I'll modify it in that direction if we agree on using PCI
config space this way.

Thanks!

>
>
> > > >  \item[\field{queue_notify_off}]
> > > > --
> > > > 2.31.1
> > >
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

