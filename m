Return-Path: <virtio-comment-return-8447-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06564C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:11:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 36DB2C6239
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:11:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1460F986E26
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:11:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EDCD3986E1C; Fri, 17 Nov 2023 11:11:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF14D986E1D
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 11:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: IqalJk8uMxG9uZoR25VMYQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700219466; x=1700824266;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAR8URUZ7qQIHbBO0DEWqA+iEOPsJrPIcQZXOmluWPM=;
        b=CSbSGHDFLkwFrOpAc6EItCKF2a1BdsbDU0Ca1EKkZbnEOURYhmUX9ZpaYRnU15U1NE
         ESAjkjLV8Il0oC72556yTDrdCiV+cHDROQb3ofUD8gD3h+s6J9IV1tn5/1yy7p4zJpKx
         Xg6axJqu0QDtWdWAIvk/g8aNk28kL6r5IrSwpmT/HCnqlX23alu0kndEdAQID5aUSmB7
         cELmFkGNKOPccQeRnHR8HHQYWaoYlHtcEcL41ZTdEnm8k1FMP5mrLVzE+jNsk1wq0UXp
         t/j7+zhA8GbDsEdbt7oqaLMqODNmLTGOj6596Cd5xCgqcrntQ0SwrL639cf4Wmi2b65+
         n2hA==
X-Gm-Message-State: AOJu0YzpTeVF3u3jc7LIqOJcZiTGw7xZdDZUFPOmrqUO09TWYumpgZsy
	TC8jK0eHHu0GV0TzZUMFdUWzVUJ4NajtDTLJBk+Zq/f3VXEJpe+6dCwXIuF+EfwnBAIZu5e7odC
	3/6VkEsw2pc734kGcDfUHQRmzTLBxegAQ/Q==
X-Received: by 2002:ac2:5dc2:0:b0:509:dd0:9414 with SMTP id x2-20020ac25dc2000000b005090dd09414mr13302449lfq.24.1700219466487;
        Fri, 17 Nov 2023 03:11:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6itobiTIJ9hEWPQojs4auqK3EE36uiPyqAy2FWad3zXhvTgtpSP06Ils/Z/lCvDUoeqnV7g==
X-Received: by 2002:ac2:5dc2:0:b0:509:dd0:9414 with SMTP id x2-20020ac25dc2000000b005090dd09414mr13302438lfq.24.1700219466149;
        Fri, 17 Nov 2023 03:11:06 -0800 (PST)
Date: Fri, 17 Nov 2023 06:11:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231117060456-mutt-send-email-mst@kernel.org>
References: <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Nov 17, 2023 at 10:20:45AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 3:38 PM
> > 
> > On Wed, Nov 15, 2023 at 05:39:43PM +0000, Parav Pandit wrote:
> > > > >
> > > > > Additionally, if hypervisor has put the trap on virtio config, and
> > > > > because the memory device already has the interface for virtio
> > > > > config,
> > > > >
> > > > > Hypervisor can directly write/read from the virtual config to the
> > > > > member's
> > > > config space, without going through the device context, right?
> > > >
> > > > If it can do it or it can choose to not. I don't see how it is
> > > > related to the discussion here.
> > > >
> > > It is. I don’t see a point of hypervisor not using the native interface provided
> > by the member device.
> > 
> > So for example, it seems reasonable to a member supporting both existing pci
> > register interface for compatibility and the future DMA based one for scale. In
> > such a case, it seems possible that DMA will expose more features than pci. And
> > then a hypervisor might decide to use that in preference to pci registers.
> 
> We don’t find it right to involve owner device for mediating at
> current scale

In this model, device will be its own owner. Should not be a problem.

> and to not break TDISP efforts in upcoming time by such
> design.

Look you either stop mentioning TDISP as motivation or actually
try to address it. Safe migration with TDISP is really hard.
For example, your current patches are clearly broken for TDISP:
owner can control queue state at any time making device modify
memory in any way it wants.

> And for future scale, having new SIOV interface makes more sense which has its own direct interface to device.
> 
> I finally captured all past discussions in form of a FAQ at [1].
> 
> [1] https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZiVj8x1s73Ed6rOsmn6LfXc/edit?usp=sharing

Yea skimmed that, "Cons: None". Are you 100% sure? Anyway, discussion
will take place on the mailing list please. 

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

