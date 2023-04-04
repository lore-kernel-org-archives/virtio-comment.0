Return-Path: <virtio-comment-return-5234-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8E3C77B6C
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 20:14:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 772F52AD7D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 20:14:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A4CD89867CD
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 20:14:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6136C986659; Tue,  4 Apr 2023 20:14:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 322899865D5
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 20:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8u4yA3wpOW6VwmGQ3iQR1Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680639261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOwynRqEfCacz0WlwIpjn7QHXLXhLVr/Y6jKvssXM50=;
        b=qsmyZDlCZTKtKJZNFlsSr5QnGYvYDJ1Y3X+7X9/gqb8/1VpimK0Q/o7c3vQOrBDoOC
         Zd10FHDfnz/1IVpsB+h8+5zJ+pelDGpxSV/FUPmL0mEVBmQrGHFsynsO669rKWOPhFdM
         DuhAZVwyCkfX7/2QEbQCeNcNKopLjpDf+iEfYFk3dcsgYVb6fJlU578layrTqKLiSj1z
         4prWMYI8grb3N//ImYvAtChGCVw6f98dbN8D1PzbquSGWlshAGcTAMuLddWW3WX71s9N
         4/tyZQvyGJJ0D7wYnAlJpQSFlG55geFHmYceL/Yvj5LwFGf/5Mfrqr5zM+vNEKZOXMRt
         eHvw==
X-Gm-Message-State: AAQBX9c/K07VsoYDSCP9G+28vCdItZTcB+dacTNVNmqOYXu3IL/mDOD2
	XcMp9NPYt3TIfzGUtAuLxWgNV4DpzwdjO6uXmd2M/bVBi02kf9LKXu+4sNs+lWbX3FoIK68UKF0
	q45AaTgeFBGOnYZQqL5lBbCXRYwBxl9ib5g==
X-Received: by 2002:a17:907:a4c:b0:8af:3382:e578 with SMTP id be12-20020a1709070a4c00b008af3382e578mr523985ejc.4.1680639261507;
        Tue, 04 Apr 2023 13:14:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350aqomzj2GpgMYmHIyvOM7e4xC+myl37/QWM73WlmvIdAr8+uyfQ12sLPMFo65D6XNvRnECTdw==
X-Received: by 2002:a17:907:a4c:b0:8af:3382:e578 with SMTP id be12-20020a1709070a4c00b008af3382e578mr523968ejc.4.1680639261199;
        Tue, 04 Apr 2023 13:14:21 -0700 (PDT)
Date: Tue, 4 Apr 2023 16:14:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	David Edmondson <david.edmondson@oracle.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230404161213-mutt-send-email-mst@kernel.org>
References: <20230323152422.113103-1-hengqi@linux.alibaba.com>
 <20230404182925.349d402e.pasic@linux.ibm.com>
 <PH0PR12MB5481969DB61A7CB30E89C3C4DC939@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230404134141-mutt-send-email-mst@kernel.org>
 <c2239805-3f62-ee76-d422-2f6c247b7747@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <c2239805-3f62-ee76-d422-2f6c247b7747@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v14] virtio-net: support the virtqueue
 coalescing moderation

On Tue, Apr 04, 2023 at 03:39:21PM -0400, Parav Pandit wrote:
> 
> 
> On 4/4/2023 1:44 PM, Michael S. Tsirkin wrote:
> > On Tue, Apr 04, 2023 at 04:32:07PM +0000, Parav Pandit wrote:
> > > 
> > > > From: Halil Pasic <pasic@linux.ibm.com>
> > > > Sent: Tuesday, April 4, 2023 12:29 PM
> > > > 
> > > > On Thu, 23 Mar 2023 23:24:22 +0800
> > > > Heng Qi <hengqi@linux.alibaba.com> wrote:
> > > > 
> > > > > +struct virtio_net_ctrl_coal_vq {
> > > > > +    le16 vqn;
> > > > > +    le16 reserved;
> > > > > +    struct virtio_net_ctrl_coal coal; };
> > > > > +
> > > > >   #define VIRTIO_NET_CTRL_NOTF_COAL 6
> > > > >    #define VIRTIO_NET_CTRL_NOTF_COAL_TX_SET  0
> > > > >    #define VIRTIO_NET_CTRL_NOTF_COAL_RX_SET 1
> > > > > + #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET 2 #define
> > > > > + VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET 3
> > > > >   \end{lstlisting}
> > > > > 
> > > > >   Coalescing parameters:
> > > > >   \begin{itemize}
> > > > > +\item \field{vqn}: The virtqueue number of an enabled transmit or receive
> > > > virtqueue.
> > > > 
> > > > Just to be on the safe side: VIRTIO_F_NOTIF_CONFIG_DATA has been
> > > > negotiated, and queue_select != queue_notify_data, is vqn supposed to contain
> > > > queue_notify_data or the number/index that is used for queue_select (I'm
> > > > talking about the PCI transport case)?
> > > Vqn has zero relation to notification config data feature and featue bit.
> > > It is the real vqn enabled via queue_select.
> > > 
> > > Once the vqn is renamed to vq_notify_id, we won't have this confusion anymore.
> > 
> > vqn here is the index. queue_select is also the index.
> > 
> Yes to both. No plan to rename them.
> 
> > Inside notifications-le.c we have:
> > le32 {
> >          vqn : 16;
> >          next_off : 15;
> >          next_wrap : 1;
> > };
> > 
> > vqn here is queue_notify_data.
> > 
> vqn in above unnamed structure is contain
> a. either vq index if CONFIG_DATA is not negotiated
> or
> b. it contains queue_notifiy_data if CONFIG_DATA is negotiated
> 
> Therefore, instead of naming it as vqn, renaming it to vq_notify_id crisply
> describe what it is for.
>
> And not some vqn n stands for notification, but "d" of data is dropped
> somehow.

vqnd then? for virt queue notification data?


> A notification identifier contains depending on negotiated feature bit.

it's not necessarily an identifier. can be e.g. just 0 for all vqs.
whatever the device needs.

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

