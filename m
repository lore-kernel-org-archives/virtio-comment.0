Return-Path: <virtio-comment-return-6334-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90F5EB64D7
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 19:55:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CEACE18C9C5
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 19:54:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7C90986581
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 19:54:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A4AE698656B; Tue, 13 Jun 2023 19:54:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90FC2986575
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: G0Kb6RcsPFyz4IMGZpEIAw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686686096; x=1689278096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSl5aOBVb5Z4WwPb6EFxxPyFkmSJQ13Tq7HNon1I618=;
        b=CJjgdULLFBrdiB57xwT+pBmdMVs4tq0FUl53Q9mgr9drjapYNeuhwofQzOxcsvQaly
         6360jI5UH5V4/HqZM2gUDgKEzhAbMM73SP+hp9IB8ky1XcbH8ZkYgy8uxfCNoq04yR4G
         9FXSTuVXWMR3RLAQTzqEoSwFvlNI5ZLG5byjc3DcbAkRyxg0SiomBBGcWWB4/ias8q9T
         gn0LiUH0OFPFapYS4+KGxSrZW//gQN2ojllsiLk97VUXDmQ/D+UqbqIUdQ+MUujOiNLW
         IxyTj+uAdAuHSPPJ4Yi4rICvns2SE31EAClIDPz/qKsaQAzy3QLbclH6RHxvozrsEtK3
         q00g==
X-Gm-Message-State: AC+VfDz4iway+iFi50JlKd9NrH240DeURYCfNIT0GJCQW//kCOH6plya
	lrtA5CrnJNBVuu53DlpRfqzeKbw2v/giC/LcFBpD6aEoDJrfuQz7pYOdgj4XXDLQu4E8M+wZjvK
	6uGmgK9/uOCMDf+ISZUF1RFpZvsmYmZMX8w==
X-Received: by 2002:a19:6749:0:b0:4f6:2e4e:e41b with SMTP id e9-20020a196749000000b004f62e4ee41bmr6124578lfj.3.1686686095816;
        Tue, 13 Jun 2023 12:54:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7thDQ6tSqiW/JrdYfLOkK9OMdPq9E4qrFX0QXMn0PVGMgxIBFbuKVrb/p7aEeD9ntvw9URAw==
X-Received: by 2002:a19:6749:0:b0:4f6:2e4e:e41b with SMTP id e9-20020a196749000000b004f62e4ee41bmr6124556lfj.3.1686686095490;
        Tue, 13 Jun 2023 12:54:55 -0700 (PDT)
Date: Tue, 13 Jun 2023 15:54:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Message-ID: <20230613154823-mutt-send-email-mst@kernel.org>
References: <20230608031325-mutt-send-email-mst@kernel.org>
 <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
 <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Tue, Jun 13, 2023 at 07:00:02PM +0000, Parav Pandit wrote:
> 
> > From: Eugenio Perez Martin <eperezma@redhat.com>
> > Sent: Tuesday, June 13, 2023 6:13 AM
> 
> > > - enable all queues before DRIVER_OK
> > > - reset all data queues before DRIVER_OK
> > > - DRIVER_OK
> > > - CVQ commands
> > > - re-enable data queues
> > >
> > >
> > > No?
> > >
> > 
> > If it is valid to write to queue_reset before DRIVER_OK, then sure. I asked for
> > that in the past at https://lists.oasis-open.org/archives/virtio-
> > dev/202305/msg00329.html
> > .
> 
> Before DRIVER_OK stage, queue_enable is already available so why to use queue reset?
> They have duplicate functionality, hence there is no motivation to support queue_reset before DRIVER_OK stage?

I do not get how.  Let's make sure we are talking about the same thing.
This is what I am saying:

Start operating:

- program queue address, size
- queue_enable

Now we change our mind about queue size or address. So:

- queue_reset
- program another queue address, size

Finally we are decided, let's start operating:

- DRIVER_OK


I don't see how it's possible with just queue_enable.


> 
> It is not explicitly mentioned in the spec that one can setup the queue using queue reset instead of queue enable.
> As Jason mentioned it is implementation specific, one device supports it and one doesn't.
> Hence, it will break on those devices which doesnt support it.
> 

Setup? No, and spec explicitly says to setup one has to use
queue_enable. But this is not what we discussed with Stefano here.

> Therefore, I would like to add it to the spec.
> "queue_reset register MUST be accessed by the driver only after device has reached the DRIVER_OK stage."

I don't think we can add MUST requirements after the proposal is
in the released spec. If device has stricter requirements than the
spec then it's not compliant.





> > 
> > >
> > >
> > > > --
> > > > MST
> > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and to
> > > minimize spam in the list archive, subscription is required before
> > > posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License:
> > > https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines:
> > > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> > >
> 


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

