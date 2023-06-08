Return-Path: <virtio-comment-return-6249-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7FAC7EE25
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:05:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 02A4A23D5E
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:05:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8B6D986675
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 15:05:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DFAB0986655; Thu,  8 Jun 2023 15:05:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CD05A98666F
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 15:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: aI7HkjQ5Mv2vl-2uVlLO8w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686236738; x=1688828738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44gUqYOIUIJgOSy3rNszMSQXWRNeYQKo1Pb2lzqnaDQ=;
        b=TRKDJ0Pem0Mhl/phR9BqclpyjSt5Tmd83b17kJB8ANfeLPPd642Uo7OeOnTwZnF3r+
         9jeScdnLAPgTB+FEnECIzZ1R3H7A+ctOeak+5SzZb5jnUPRsibaQYo686p/tMySqObJE
         rw3USiS+/iInuWBz6mI2lgMi/KF+0ojx+p9t9F5xZvcTu56QFHWpyWmECRSZ0PQLps0p
         IJ9fEXRQOKflKVM5O6paK0E/HF/ih0/r/kw4RCoorjeljtOIN+NkxWrF4zjQs+re1sYj
         65xc4KT6jj6x0chnKuV1LvoBkIONzYdnzni/xIETiOSonrFAHxhPt+C5z+GGrFZIXSbU
         41gA==
X-Gm-Message-State: AC+VfDzOWmJHTXeW6VqoLqBGSj/vgHiNcxTvlNC+HfXpkpwmumZnvKkZ
	O4Leqtxk8OwnCZCyYp+8ghIUY7y9kRwtGqHoV3nGUanGW5f10RJmhKut3eJZ4Yx/rx3B8GECcPd
	67u12e3nxvh7qrom78wCZHXM5s5V/46Z1Qw==
X-Received: by 2002:a05:600c:2217:b0:3f7:effd:83e4 with SMTP id z23-20020a05600c221700b003f7effd83e4mr2005721wml.38.1686236738494;
        Thu, 08 Jun 2023 08:05:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zw5uFUrRzZiHERGwo05/WOjmXiw1Iq14Par7kRPLU4d3n66TgeW6Pi4E67To8CjQQOZ4ZCA==
X-Received: by 2002:a05:600c:2217:b0:3f7:effd:83e4 with SMTP id z23-20020a05600c221700b003f7effd83e4mr2005694wml.38.1686236738117;
        Thu, 08 Jun 2023 08:05:38 -0700 (PDT)
Date: Thu, 8 Jun 2023 11:05:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Message-ID: <20230608110415-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606151520-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815243B0C6942A0E5B6B5FDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWdKsbCiZqp=kNQOoaD6ooB+m2pcUB+nSLU3e5gCyLL1bQ@mail.gmail.com>
 <PH0PR12MB54814006554B79237E0C1282DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54814006554B79237E0C1282DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective
 queue enabling

On Thu, Jun 08, 2023 at 01:15:46PM +0000, Parav Pandit wrote:
> 
> 
> > From: Eugenio Perez Martin <eperezma@redhat.com>
> > Sent: Thursday, June 8, 2023 7:54 AM
> 
> > > Yes, I have read it few times and every time I concluded that:
> > > it does not say that it must be done before DRIVER_OK and cannot be done
> > after DRIVER_OK.
> > >
> > 
> > I also read it this way to be honest. From a POV, to allow it if a device does not
> > handle it could be considered a fix, rather than an addition.
> > 
> > I'm assuming we need to modify the standard just because it was not explicitly
> > allowed. To explicitly allow it before DRIVER_OK was not needed because it was
> > already widespread.
> > 
> It was explicit enough that queues can be enabled after DRIVER_OK.

Weird, there's spec text saying they can't.

> And queue reset is the perfect example showed that.
> Who ever implements the device should be ready to handle queue_enable writes after DRIVER_OK stage, it is really that simple.
> There is no need of new feature bit.

Hard to change the past, we didn't ask people to do it.

> > It would be great for me if we agree the device must support it, but maybe it is
> > just too late for that.
> Device must support it. There is nothing late about it.
> And if you are considering LM flow, then for sure it is not late because LM is just not fully baked.

Considering regular use, no LM.

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

