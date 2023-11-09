Return-Path: <virtio-comment-return-8290-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944EFC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 09:53:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C50832CADA
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 09:53:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9B2CA986CD9
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 09:53:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7C283986CCD; Thu,  9 Nov 2023 09:53:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B618986CCE
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 09:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: O90O35KoMmKXDCSsv7hkDQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699523595; x=1700128395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozDtW9Z7kXerpKxW5dTdJ1IuN/iOvYIF6PWOUixvpKM=;
        b=NVU+oWrxLr/AeP2B6hPYQtyajyFcc3WH9LOekqhTukqDJLOFa5d0vaVsVH30l3J3C7
         6dO2y0wWqBvHnbonjrVru8Hvxdwk96Mz/A1OVC8GKX6huP+B3UQnXuU+tm6yHTXfUyC4
         OKH/u7L4V8+ZYwhAKVISPIZda5j8pYclLaAXaHDINwTJ2ABM5NCPnwhPQjeEdlg1voV4
         i3q3e64PpwY4u9G8dbXPmyWB829/Wb3+yOE5EfdnQTYcRvYfp9YMAL2Zqcv7R3FLaD40
         Q4XWi6ZB9MSFARMnOueBrvvG+S+d6ggdYbj+soANAoIEq2w6jWg3HCzHmDktZX/eBzyg
         FCmQ==
X-Gm-Message-State: AOJu0YzKNuS+DxTNhNpsXUypd4ER4VsxrK2ufPfq3owHOhS6P6XFLoFn
	0EtYaCSgyUEfMbgCenqRO1S0CbsSyRh8yKYomOxJAhU1DzBhWf9FbMoE6YSEz1x2zP6B3cEUZl6
	Z5FPcBcX4gCfwf+IdIIrLIMYBzMxCEo6fBg==
X-Received: by 2002:a17:906:dc90:b0:9a1:bd33:4389 with SMTP id cs16-20020a170906dc9000b009a1bd334389mr3862899ejc.74.1699523595087;
        Thu, 09 Nov 2023 01:53:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfYxS001B+UtyIwoCTcsQnEP6MjBNITFXQMsdlZfJkmUuOR2etbz1x+MKmT9wT53GKhxe0cg==
X-Received: by 2002:a17:906:dc90:b0:9a1:bd33:4389 with SMTP id cs16-20020a170906dc9000b009a1bd334389mr3862889ejc.74.1699523594765;
        Thu, 09 Nov 2023 01:53:14 -0800 (PST)
Date: Thu, 9 Nov 2023 04:53:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231109044925-mutt-send-email-mst@kernel.org>
References: <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
 <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com>
 <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com>
 <PH0PR12MB5481BCA941D86E1031D7A5D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7a0e7cef-434c-4049-b72f-b8188ecedbaf@intel.com>
 <DM8PR12MB54801250188E085F6D03869EDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231109033838-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811CEC8B65FFA26FCA30A6DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811CEC8B65FFA26FCA30A6DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

On Thu, Nov 09, 2023 at 09:10:55AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 9, 2023 2:12 PM
> > 
> > On Thu, Nov 09, 2023 at 06:28:17AM +0000, Parav Pandit wrote:
> > > > >> The registers are control path in config space, how 400G or 800G affect??
> > > > > Because those are the one in practice requires large number of VQs.
> > > > >
> > > > > You are asking per VQ register commands to modify things
> > > > > dynamically via
> > > > this one vq at a time, serializing all the operations.
> > > > > It does not scale well with high q count.
> > > > This is not dynamically, it only happens when SUSPEND and RESUME.
> > > > This is the same mechanism how virtio initialize a virtqueue,
> > > > working for many years.
> > > No. when virtio driver initializes it for the first time, there is no active traffic
> > that gets lost.
> > > This is because the interface is not yet up and not part of the network yet.
> > >
> > > The resume must be fast enough, because the remote node is sending
> > packets.
> > > Hence it is different from driver init time queue enable.
> > 
> > Maybe but I think not qualitatively different.
> > If you care about these things please provide some estimates.
> > I just don't see how queue resume writes even with 64k queues will saturate an
> > express link.
> > 
> It is not the bw of the link.
> It is how the need for the device to be always read to suspend those many queues through register interface.

read->ready?

If we want to we can solve it btw. Prohibit changing queue select
while suspend is in progress.

But more importantly once Zhu Lingshan stops arguing about suspend bit
he'll hopefully work on transport vq. Then we can have it in config
space and at the same time not use up a register.


> > 
> > > > >> See the virtio common cfg, you will find the max number of vqs is
> > > > >> there, num_queues.
> > > > > :)
> > > > > Sure. those values at high q count affects.
> > > > the driver need to initialize them anyway.
> > > That is before the traffic starts from remote end.
> > >
> > > > >
> > > > >>> Device didn’t support LM.
> > > > >>> Many limitations existed all these years and TC is improving and
> > > > >>> expanding
> > > > >> them.
> > > > >>> So all these years do not matter.
> > > > >> Not sure what are you talking about, haven't we initialize the
> > > > >> device and vqs in config space for years?????? What's wrong with this
> > mechanism?
> > > > >> Are you questioning virito-pci fundamentals???
> > > > > Don’t point to in-efficient past to establish similar in-efficient future.
> > > > interesting, you know this is a one-time thing, right?
> > > > and you are aware of this has been there for years.
> > > > >
> > > > >>>>>> Like how to set a queue size and enable it?
> > > > >>>>> Those are meant to be used before DRIVER_OK stage as they are
> > > > >>>>> init time
> > > > >>>> registers.
> > > > >>>>> Not to keep abusing them..
> > > > >>>> don't you need to set queue_size at the destination side?
> > > > >>> No.
> > > > >>> But the src/dst does not matter.
> > > > >>> Queue_size to be set before DRIVER_OK like rest of the
> > > > >>> registers, as all
> > > > >> queues must be created before the driver_ok phase.
> > > > >>> Queue_reset was last moment exception.
> > > > >> create a queue? Nvidia specific?
> > > > >>
> > > > > Huh. No.
> > > > > Do git log and realize what happened with queue_reset.
> > > > You didn't answer the question, does the spec even has defined "create a
> > vq"?
> > >
> > > Enabled/created = tomato/tomato when discussing the spec in non-normative
> > email conversation.
> > > It's irrelevant.
> > >
> > > All I am saying is, when we know the limitations of the transport and
> > > when industry is forwarding to not introduced more and more on-die register
> > for once in lifetime work of device migration, we just use the optimal command
> > and queue interface that is native to virtio.
> > 
> > we really do not need to prematurely optimize all things.
> > control path is control path it is going to be slow because virtio designed it to be
> > slow and drivers don't optimize it.
> > Shaving off a microsecond here or there is going to do nothing except increase
> > maintainance costs.
> 
> Control path post device initialization for large part is through the cvq.

Really depends on the device. For virtio net most of the time is
spent on filling up receive queues and sending network announcements
and such.

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

