Return-Path: <virtio-comment-return-6205-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4788C77B7A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 07:37:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D70FE29FC5
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 07:37:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6C66986652
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 07:37:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AE490986647; Wed,  7 Jun 2023 07:37:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9A7F198664A
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 07:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Tnso0D0eNPGZ1rr8ZMObfQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123457; x=1688715457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QB3sXCfy9QWc+z23Kzs8HUnKuMkjUiUjuvntu1funwg=;
        b=VjedXZNKnjaVsynkkrzgZmNd4CwuQ+mXnUxP3YsJFdVqwrkyGrSRXesZiILLtBZeCv
         dEpChLZbadvhNQ0A5gLXQk4zcD27DcW8a0wKKTf4YKgXWXKzS3v4tnz3PvndWBs7K/qy
         F/OXrziJkhSZFJthY29xhvbqE8ijSe84fyM/NeeljbzYfJ+SqRsQlvRV4egTCEMQigD3
         16pMDwy/heQm6nvfrpWGi64FOaGR+UPziPoYI0LwzyhXVtIQVJ7weamiI7Am7hTgKNEL
         N/IOShUCP6a5nVMeEBcboBjwnj8eqiBCMA9kWhtgYf/WheNdDenGtg06eLKEjv8opcAm
         hSZQ==
X-Gm-Message-State: AC+VfDzc9Tkc/ld2HnAIH/HJPisNSz9cVBPIuXJo/c2Aq+XfH9xYH6Vm
	QEjSggYHKOn6BtdG+LmGEMmEsxl1atAZmQ5Hc5JSK3Qi1SFrUlsjM2vxBHx3IvljTpzA560G96D
	8ozSikLD4SWmPMdcxIAxeSNh1tMywFlzE+Zit7kO2Qjwy983VAg==
X-Received: by 2002:a25:a05:0:b0:b99:5707:4e6f with SMTP id 5-20020a250a05000000b00b9957074e6fmr4395389ybk.32.1686123457217;
        Wed, 07 Jun 2023 00:37:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HHa9OcgKb/xcJDk8KpHPbWMoUCw5pv+QL0KJ3wATAYknkkuXgGiYS+Xcl5q6bgSp/x0HSl5nNCFMe/YctCl8=
X-Received: by 2002:a25:a05:0:b0:b99:5707:4e6f with SMTP id
 5-20020a250a05000000b00b9957074e6fmr4395384ybk.32.1686123456968; Wed, 07 Jun
 2023 00:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606175511.2337208-3-eperezma@redhat.com>
 <20230606150327-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606150327-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 7 Jun 2023 09:37:00 +0200
Message-ID: <CAJaqyWfpXcPn_Y_HF3bRHxCJCr5QPLS9e34AoBG1nr2-eK8Upw@mail.gmail.com>
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

On Tue, Jun 6, 2023 at 9:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Tue, Jun 06, 2023 at 07:55:11PM +0200, Eugenio P=C3=A9rez wrote:
> > Reusing virtqueue reset method to enabling a vq.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  transport-pci.tex | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/transport-pci.tex b/transport-pci.tex
> > index a5c6719..04c0429 100644
> > --- a/transport-pci.tex
> > +++ b/transport-pci.tex
> > @@ -375,6 +375,10 @@ \subsubsection{Common configuration structure layo=
ut}\label{sec:Virtio Transport
> >
> >  \item[\field{queue_enable}]
> >          The driver uses this to selectively prevent the device from ex=
ecuting requests from this virtqueue.
> > +        If the driver negotiates VIRTIO_F_RING_ENABLE_ANYTIME or
> > +        VIRTIO_F_RING_RESET, the driver writes 1 to this field to enab=
le a
> > +        virtqueue.  See \ref{sec:Basic Facilities of a Virtio Device /=
 Virtqueues / Selective Virtqueue Enable}
> > +        and \ref{sec:Basic Facilities of a Virtio Device / Virtqueues =
/ Virtqueue Reset}.
> >          1 - enabled; 0 - disabled.
>
> No, this is always used to enable queues even with no features.
>

Yes. Now I see it is confusing if reading the spec and not the diff,
but my intention was to not modify the behavior without the feature
flags. Maybe there is a better way to achieve it.

> >  \item[\field{queue_notify_off}]
> > --
> > 2.31.1
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

