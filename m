Return-Path: <virtio-comment-return-6211-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBE7C77B7A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:03:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0DDC2120D44
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:03:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE38D986655
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:03:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D67B598664C; Wed,  7 Jun 2023 09:03:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C24AC98664F
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 09:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hnAIcvy1OgeGRmu7VJjBqA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128594; x=1688720594;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7UNzZu9GoGN3RFqdr9rH/oIL4MEzY2uQyvUdZXtht4M=;
        b=cT3YgFPDFxSAQonHQ7zk+cF2Gse7NelCteXChE+IklBPCbqaN0EwKqjbQhNwXbjFSy
         GtACsIILrrJNHhDvRZQtHkWEw3HZt1ujCoG6KaqIhdndl17jGxNRI1zTNLnKp5W9eJfk
         Mp5k8QdtJsp0zM4QtpRyRhphw8vK67YStxbtZX3yBRzru9lMM6w564P9Tzcm/XECSMYm
         LW3NUChvGUVQqoCOvnWeylrBkDdDpABgcHSd4KoDnph20NHNQwtSL2oZ8HqrO3fvf5rO
         P6Su79icWGc3Tjr/oHr25A6zNQcpB0eFdI6bx0ct73M9lJEKOzSZD1X32gep0Oj2tMfF
         8qHw==
X-Gm-Message-State: AC+VfDxL4ZvDdnW/659xGxV6XKyMkN5e+eBSF+QAEc1DRrioeJTNyptr
	+meV8ACKl2W2xP0EQoxkxkOiBh3DZVJlWGxbN2VwrJxIwW+gqqluD0iQ40LBc/saCBvsFNMSt56
	zutMnfFC6NSMldLAiq7pQurJCrkkgXa4F1Q==
X-Received: by 2002:a5d:58d5:0:b0:30a:8c0b:320d with SMTP id o21-20020a5d58d5000000b0030a8c0b320dmr3654919wrf.11.1686128594530;
        Wed, 07 Jun 2023 02:03:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/Yl6apSpsh9Eovp9duAHcOwVJCFRR88SDy/DbXzVWSv3hEyq0wDzZKKWhweJdknVMLvq7Rw==
X-Received: by 2002:a5d:58d5:0:b0:30a:8c0b:320d with SMTP id o21-20020a5d58d5000000b0030a8c0b320dmr3654885wrf.11.1686128594218;
        Wed, 07 Jun 2023 02:03:14 -0700 (PDT)
Date: Wed, 7 Jun 2023 05:03:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: virtio-comment@lists.oasis-open.org,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com, alvaro.karsz@solid-run.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com,
	stefanha@redhat.com, Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com
Message-ID: <20230607050112-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-3-eperezma@redhat.com>
 <20230606150327-mutt-send-email-mst@kernel.org>
 <CAJaqyWfpXcPn_Y_HF3bRHxCJCr5QPLS9e34AoBG1nr2-eK8Upw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfpXcPn_Y_HF3bRHxCJCr5QPLS9e34AoBG1nr2-eK8Upw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH 2/2] virtio: pci support virtqueue selective enabling

On Wed, Jun 07, 2023 at 09:37:00AM +0200, Eugenio Perez Martin wrote:
> On Tue, Jun 6, 2023 at 9:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jun 06, 2023 at 07:55:11PM +0200, Eugenio Pérez wrote:
> > > Reusing virtqueue reset method to enabling a vq.
> > >
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > ---
> > >  transport-pci.tex | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/transport-pci.tex b/transport-pci.tex
> > > index a5c6719..04c0429 100644
> > > --- a/transport-pci.tex
> > > +++ b/transport-pci.tex
> > > @@ -375,6 +375,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> > >
> > >  \item[\field{queue_enable}]
> > >          The driver uses this to selectively prevent the device from executing requests from this virtqueue.
> > > +        If the driver negotiates VIRTIO_F_RING_ENABLE_ANYTIME or
> > > +        VIRTIO_F_RING_RESET, the driver writes 1 to this field to enable a
> > > +        virtqueue.  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Selective Virtqueue Enable}
> > > +        and \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
> > >          1 - enabled; 0 - disabled.
> >
> > No, this is always used to enable queues even with no features.
> >
> 
> Yes. Now I see it is confusing if reading the spec and not the diff,
> but my intention was to not modify the behavior without the feature
> flags. Maybe there is a better way to achieve it.

This is bad:

 Driver always does X.
+If Y then driver does Z.


This is good:

-Driver always does X.
-If Y, then driver does Z, otherwise X.

even though it's a bigger patch, but patch review is
secondary to a readable spec.



> > >  \item[\field{queue_notify_off}]
> > > --
> > > 2.31.1
> >


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

