Return-Path: <virtio-comment-return-8592-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC45C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:40:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BAEC43309F
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:40:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A36129868A6
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:40:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 870D79862D9; Fri, 24 Nov 2023 05:40:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 766A89868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 05:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: pssyTWAvOTqgFYXJ8MkCgw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700804409; x=1701409209;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmUizR27pQdltc/spHnwh2BlcdmGF4gSC0jhWNmNInw=;
        b=EaUEVeDkeaRYWu2IMCMjtqDa7C0PitfjvtxXt3g6FwYdk3Vl72GOz3JWX/U0OGZGme
         7cdx9qmpzJgsfa2ZY/jKUnemduU9gm76I2GsonF+xt7vXiTz79979ruGizlyloXVvZ9P
         phuo1Ly5UiVwf4C10PWwUq41pmUN0gkzOnrUctfZxHJiXn89rZGyhNmjAK4N6EgUsyMq
         CWwtU4QD4u5JQvm7+yarHsZYP1kFBMuNEHiCo68GafJgDh9j5oFm0dJJSIeRg/LXTpu5
         sI/GvuvFoDnOJlZCyStwWOVioZDFCHemS8aL5K+/rTQ8kCPqTGOnOtwqGo5Er+Tks+ZE
         Dk4g==
X-Gm-Message-State: AOJu0YwyMDPGFT5Qekc6upuyrD/TZcZMpji+vj4Y6q3P89fnhOuNsEuk
	1OkIiqhS88PZKeNRP5W1Qg8oLs7M9QEdePFxypqwpAemlVlMcL/KT0jrELkStkE3E9XdbJInRLN
	uE9uj9R60ZefUnXMpJQ8UWt+rPBS7RgpnEw==
X-Received: by 2002:a50:d69a:0:b0:548:55aa:a592 with SMTP id r26-20020a50d69a000000b0054855aaa592mr1144248edi.9.1700804409532;
        Thu, 23 Nov 2023 21:40:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiSyh/nEfnXvEqFZc+hHmd6lLuNQAEH8xO/itkFqjeXeKpnb//le+1aIP8z2i6Ds+opV3Cow==
X-Received: by 2002:a50:d69a:0:b0:548:55aa:a592 with SMTP id r26-20020a50d69a000000b0054855aaa592mr1144237edi.9.1700804409172;
        Thu, 23 Nov 2023 21:40:09 -0800 (PST)
Date: Fri, 24 Nov 2023 00:40:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231124003337-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvU2sqVXAeEUykia2M-6rP1_nMemPH8eNZTEoHR0wUfog@mail.gmail.com>
 <PH0PR12MB5481FEDBA21656E29452AC78DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEudhoDfY2ZcuA3J0ww=9Pm7qcMRasvZ8CvBeGVL9SPMDw@mail.gmail.com>
 <20231122024459-mutt-send-email-mst@kernel.org>
 <CACGkMEvgwg7hA52gHdgu_i1wtKtRgUjuHWO0xgvpogQBTLbZhw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvgwg7hA52gHdgu_i1wtKtRgUjuHWO0xgvpogQBTLbZhw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Nov 24, 2023 at 11:56:16AM +0800, Jason Wang wrote:
> On Wed, Nov 22, 2023 at 3:48 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Nov 22, 2023 at 12:13:34PM +0800, Jason Wang wrote:
> > > > > What's wrong if we just allow them to be R/W over adminq/cmmands?
> > > > >
> > > > As explained before,
> > > > Each guest has its own dedicated non mediated interface as defined in virtio spec to not involve hypervisor.
> > >
> > > So what's wrong with inventing per VF queue to do that? For example
> > > transport virtqueue.
> >
> > Nothing is wrong with this.
> >
> > But what is problematic is just re-using config space for migration because
> 
> It's not a reusing, it works exactly like this proposal:
> 
> 1) VF config space is assigned to guest
> 2) using PF queue to migrate
> 
> The only difference is the command:
> 
> In this proposal, it is
> 
> 1) virtio_dev_ctx_pci_vq_cfg structure
> 2) in transport virtqueue, it introduce a set of commands to access
> one or several fields on the common cfg
> 
> Thanks

The problem with 2) is no one seems to bother building it right now,
so I'm not sure we can with a straight face require people to
use this infrastructure which does not exist.
And the need this patchset is trying to address is real. So I think
we should address this proposal on its own merits not on how well
it compares with a theoretical transport virtqueue.

> > it means we can not just say "don't access device after it is stopped"
> > because yes you need to access it to save/restore state.
> > And a new interface over admin cmds just for this side-steps the
> > issue nicely.
> >
> > --
> > MST
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

