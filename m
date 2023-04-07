Return-Path: <virtio-comment-return-5313-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A35C6FD1D
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:45:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 368382AD7E
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:45:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 249639865DF
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:45:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1C28B9865D8; Fri,  7 Apr 2023 11:45:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0BE369865D7
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Apr 2023 11:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kRxEDtBfNC6rrmDX4RmGZg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680867952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oeo2GtxtJgQxsIkSJcGWiw/zyttifHUvTEbheDn1vvA=;
        b=G5CKuFZvsq9L9CVIL/o85llfuhvKtGxn7FJQwfocwxOLo1XjDfa0cXEv2v/2JCiZdo
         YkLdR1Pt5SOv7SLFQLqKUFvmlV/jH6MNSX6CE6aLlWrftMtA+CKc1zJFfAzPK5Bo5R9h
         yGja/4tHEyY/j9dOmdUNiD2Ny457fxJ72A0XJs1tisfXuecXe6r/PU3UsgKvkECVpOPn
         cUG5tdsiM1mtB1J3Vg0hSinh4yY4hMtORI/gqogd40Fsl+QkW4NweI+1FhmpzWjdNZ62
         9A6ciX2ule+x5i4TTqBpK2MeNOzN5vHw+KZHMQgcoCY4ieh85IDmbLdquzge21srVR1m
         lq8Q==
X-Gm-Message-State: AAQBX9f1LBcKSIbaErv8UVysSfu5tBt5ryrQ0scFuwxz7EvPzW9HBLC/
	UnpSbrpCFx8sBXl8fZfeeY/DWE/eLNx341OG9Oh4DXUGAnym3tOnMEz7mN5BnJENt7IfWT48Tqw
	TL/YU8WF+CSeyK0NMvUDnx/gi3RU8bvA2gQ==
X-Received: by 2002:a05:600c:2206:b0:3ee:7d95:a39f with SMTP id z6-20020a05600c220600b003ee7d95a39fmr1070666wml.33.1680867952068;
        Fri, 07 Apr 2023 04:45:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350a6PA0T9TLTGUK42QRYd1qyKnBb6hHI+OosOEboHOBYQPplNz+K09w5Ac9NdBGDWSDwg6xPTA==
X-Received: by 2002:a05:600c:2206:b0:3ee:7d95:a39f with SMTP id z6-20020a05600c220600b003ee7d95a39fmr1070648wml.33.1680867951772;
        Fri, 07 Apr 2023 04:45:51 -0700 (PDT)
Date: Fri, 7 Apr 2023 07:45:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-dev@lists.oasis-open.org,
	virtio-comment@lists.oasis-open.org,
	Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	David Edmondson <david.edmondson@oracle.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230407074514-mutt-send-email-mst@kernel.org>
References: <20230323152422.113103-1-hengqi@linux.alibaba.com>
 <20230404182925.349d402e.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20230404182925.349d402e.pasic@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio-dev] [PATCH v14] virtio-net:
 support the virtqueue coalescing moderation

On Tue, Apr 04, 2023 at 06:29:25PM +0200, Halil Pasic wrote:
> On Thu, 23 Mar 2023 23:24:22 +0800
> Heng Qi <hengqi@linux.alibaba.com> wrote:
> 
> > +struct virtio_net_ctrl_coal_vq {
> > +    le16 vqn;
> > +    le16 reserved;
> > +    struct virtio_net_ctrl_coal coal;
> > +};
> > +
> >  #define VIRTIO_NET_CTRL_NOTF_COAL 6
> >   #define VIRTIO_NET_CTRL_NOTF_COAL_TX_SET  0
> >   #define VIRTIO_NET_CTRL_NOTF_COAL_RX_SET 1
> > + #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET 2
> > + #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET 3
> >  \end{lstlisting}
> >  
> >  Coalescing parameters:
> >  \begin{itemize}
> > +\item \field{vqn}: The virtqueue number of an enabled transmit or receive virtqueue.
> 
> Just to be on the safe side: VIRTIO_F_NOTIF_CONFIG_DATA has been
> negotiated, and queue_select != queue_notify_data, is vqn supposed
> to contain queue_notify_data or the number/index that is used for
> queue_select (I'm talking about the PCI transport case)?
> 
> Regards,
> Halil

I think it's the vq number as it says here, this is not transport specific.

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

