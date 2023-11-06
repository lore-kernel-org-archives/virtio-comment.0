Return-Path: <virtio-comment-return-8212-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B95C4167D
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:27:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C60B3A380B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:27:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A6F6998672B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:27:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8A17F98671A; Mon,  6 Nov 2023 11:27:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7978B98671B
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 11:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2mZsA1NNOe2LLf893ct3OA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699270068; x=1699874868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1TyRVMkVGeiXPh8VEwlKk3CZZHhRMgsvIwxeOTT9vk=;
        b=pD/a0q4Nm6I2TPOA8aaiMovrmlBSUgLDU8FsJ91o2RTYb7U/ZxxF0algxLNc9deK9F
         M9v/9RtYnpalO6oS1SKJRoxIVEfGfmNPPJP1BQ/hbu/fVPFkVl3fEpPV8MMEYA6EOLqH
         pCSlppHqEx+fkooVhQP2hm5eK2ZvRhALr0IYP1kzvzH5qiIm/VwtW2ipnPKff5LgyG3y
         CJ4LcGemVzrBwUb4w6Awdo1/7x8Jh8EBDUHmc7WV17rkDKQqxnFo6suZn1IG0YI3tYWP
         z3+cDjmsTWiw59iB/qUQTbo07oGEvVwI2ffdwDucwooZYGrneUe9AjYKing45DQcFNjN
         t5xg==
X-Gm-Message-State: AOJu0Yw5kuJtrm05UQN+NiF5DSXRIYjLFuBl9L/9ohHGK1PdE4klQcQa
	Vle0BM+6ig5xCfLsFPoBZOcUP2VElSGVOFLabJbFFqIW/+mFgObg0jLQCPmpz4fDWb1Vm2whlrJ
	0ILi+lH+BnnqZF+QI7OzxGnK9Z6Gn1SORQg==
X-Received: by 2002:a05:6512:3ba7:b0:509:49f1:b7c8 with SMTP id g39-20020a0565123ba700b0050949f1b7c8mr11238149lfv.21.1699270067895;
        Mon, 06 Nov 2023 03:27:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUlhtpqa2C+K96wEdadgvThYFKvBYXtw+686qkJJfFCkt7d6TIhfwjvousQeOISa7g8o18nQ==
X-Received: by 2002:a05:6512:3ba7:b0:509:49f1:b7c8 with SMTP id g39-20020a0565123ba700b0050949f1b7c8mr11238126lfv.21.1699270067548;
        Mon, 06 Nov 2023 03:27:47 -0800 (PST)
Date: Mon, 6 Nov 2023 06:27:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231106062321-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231106052340-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811E4E56B40A661878D8D7DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811E4E56B40A661878D8D7DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Mon, Nov 06, 2023 at 11:21:12AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, November 6, 2023 4:00 PM
> > 
> > On Mon, Nov 06, 2023 at 04:34:44AM +0000, Parav Pandit wrote:
> > > > Do you know there are locked transaction and atomic operations in PCI???
> > > Can you explain how PCI does RMW locked transaction?
> > > Is it one TLP or multiple?
> > 
> > Parav what are you asking about here? 
> 
> > pcie supports CAS and Swap which likely
> > can work for this use-case - these are non posted writes. It's in the pcie spec.
> PCI spec do not have atomic OR operation.
> Lingshan in above comment suggested some unknown locked transaction and atomic operation.
> So I was asking him which is that atomic operation and how PCI does it?
> I don't know if any that can do PCI atomic OR without a workaround.

Well this is not what you wrote - you asked about RMW and that's exactly what CAS does.
Maybe you should take a bit more care writing then. Generally this
discussion would benefit a lot if people stop shooting from the hip.

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

