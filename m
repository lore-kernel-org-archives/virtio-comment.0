Return-Path: <virtio-comment-return-7980-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F613C25B6B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:15:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 938AC2ACB0
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:15:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74C5B986A5A
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:15:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5DEED986A4F; Thu, 26 Oct 2023 09:15:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4CE35986A50
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 09:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wSv7fDelOZOTYh-MEwSrCQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698311751; x=1698916551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ/plGbQaTb93SN0x/rixyIGfRskx3iq9CFdMekmYO8=;
        b=YM+JjmhczAv9UStMycmYLGyXtMD0gLDlZa7VCs5VPNOwtoii4EsjDOE6CxMqzNQAfM
         l+Df7bcOObD+89QVTDLvMltCOh0ABK4kB2sHE5ghjV9RizbcTBPogKhIEp8XXpwfiCDw
         eVL0PIMEVYmHBgMOh0m6x3rYV21eY9hVNmBijek/dtV1Ut3IofMJjRgnpwe//JvFr12f
         BsekyD2COQZyFzkYn5qtb5aNYrogVUV1/dAKumGBHCA+k0tdEIulkVVRE/r8s3WzGkI5
         RhlGFLwHwa/tack/sUKq0VwM10pJwfBO6TRHYg0Xinhb3qJzM0rLeVogvc/lSP4rVlCx
         AzBg==
X-Gm-Message-State: AOJu0YwqWSkgqjkiI+5OmgDwNMTUt6lFwAcRGbL7grUcCIxNO0KKgc3g
	9YE3TluH/k52r+0p2Cq63SC2Z9INY9wT6XkoNd29yVwMSQ1jDy5/q0E+f6lNfQ5YlSRXq2yuhNS
	YlrG7lsHyy/ao0ZMVJuSgjOrw9F8SEkcL6w==
X-Received: by 2002:a17:907:360d:b0:9c4:4b20:44b2 with SMTP id bk13-20020a170907360d00b009c44b2044b2mr14503983ejc.23.1698311751492;
        Thu, 26 Oct 2023 02:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3z6ViO3dXPyrKEbjdGB9VAm8qc8ngU9QO67SdmHffq7GREdEz1Aheq/QxenCtWp7tYgi9jg==
X-Received: by 2002:a17:907:360d:b0:9c4:4b20:44b2 with SMTP id bk13-20020a170907360d00b009c44b2044b2mr14503975ejc.23.1698311751128;
        Thu, 26 Oct 2023 02:15:51 -0700 (PDT)
Date: Thu, 26 Oct 2023 05:15:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20231026051240-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Thu, Oct 26, 2023 at 08:38:51AM +0000, Parav Pandit wrote:
> > 
> > > The question is, do we need this generic facility beyond virtio-net?
> > 
> > I would try to avoid solutions specific for virtio-net, as other devices may need
> > to reuse them and it would be bad to need to add quirks for that.
> No need to add the quirk.
> But I would like to listen if there is any concrete requirement.
> And if there is, possibly such device can add the cvq at that point for dynamic work.
> So, this will still provide the unified approach when/if needed on other devices.

What do you want to know? Whether dynamically adding/deleting queues is
useful generally? For example, queue per CPU is not uncommon to avoid
need for locks. In the presence of CPU hotplug, the natural thing to do
is to add/delete them.

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

