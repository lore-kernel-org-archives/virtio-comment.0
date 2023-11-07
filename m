Return-Path: <virtio-comment-return-8249-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69282C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:36:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BAD9026A3C
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:36:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8DF88986BDC
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:36:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 774AA9867FD; Tue,  7 Nov 2023 11:36:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 68C699867FE
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 11:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: YQtUjX6fNtiyC4SSQbIHuQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699356967; x=1699961767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72BJc0fJnigFDTzRmCXoVardmMi2guVBtSFDAdc58x4=;
        b=jE9BHhrO6uMQxWK7+C8G5NmnzRgIlfqQwFYpk+wf5kByu3/E57fOy60uz8Fa1g0dyO
         z9yte1DQOQQUpgHE8iVZjNlMkoZvFFIpnD/LwMhSuzK+57+OSa0wRDWUBgYdjthGw5kW
         wiXi6HELxgAWlS2QZDaEh9cNlFmCxax4oqhcG5hGZoywJZB9AB7sIaqGwAFl+ncXtixP
         aWL6SBGZG0scZqUKM08EZx7r5ii2198oEAAgYDJbG3nUuYWIafloKlYcAVlIEIlDsJR0
         dED0A9J1DFEkq2d8I8/WX7Ral8rhw1wWclBOf8jgqKtayPAIIPga6AJUk8thlR/9YEZa
         P20A==
X-Gm-Message-State: AOJu0Ywl6R5dyN5p/6UJU6LlT5JaNHvkJaYpejicuFL3dxHPQNThI5Xh
	p5e/2KgBRWf4zF5dTgyP50cZl2IUOcffUcBzoT27L6Ec1SMFrSAto9EPcaN6C0eEN2YgwP1LNQS
	ka9UOeDTMRxg4Rqrt1SXu1K19CTn/HiXTBw==
X-Received: by 2002:a5d:5109:0:b0:324:84cd:5e67 with SMTP id s9-20020a5d5109000000b0032484cd5e67mr18986794wrt.6.1699356967680;
        Tue, 07 Nov 2023 03:36:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYzmdz9ves/G6OUcBcGFavTQGQoxPh02pklA50IfPKiDaR1Brz8SwalsqPXQX0RSyvr4/jdQ==
X-Received: by 2002:a5d:5109:0:b0:324:84cd:5e67 with SMTP id s9-20020a5d5109000000b0032484cd5e67mr18986773wrt.6.1699356967350;
        Tue, 07 Nov 2023 03:36:07 -0800 (PST)
Date: Tue, 7 Nov 2023 06:36:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231107063351-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231106052340-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811E4E56B40A661878D8D7DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4dccc934-a6b3-4c41-8f24-27b8eda9a3bd@intel.com>
MIME-Version: 1.0
In-Reply-To: <4dccc934-a6b3-4c41-8f24-27b8eda9a3bd@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Tue, Nov 07, 2023 at 06:02:21PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/6/2023 7:21 PM, Parav Pandit wrote:
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, November 6, 2023 4:00 PM
> > > 
> > > On Mon, Nov 06, 2023 at 04:34:44AM +0000, Parav Pandit wrote:
> > > > > Do you know there are locked transaction and atomic operations in PCI???
> > > > Can you explain how PCI does RMW locked transaction?
> > > > Is it one TLP or multiple?
> > > Parav what are you asking about here?
> > > pcie supports CAS and Swap which likely
> > > can work for this use-case - these are non posted writes. It's in the pcie spec.
> > PCI spec do not have atomic OR operation.
> > Lingshan in above comment suggested some unknown locked transaction and atomic operation.
> > So I was asking him which is that atomic operation and how PCI does it?
> > I don't know if any that can do PCI atomic OR without a workaround.
> 6.15 Atomic Operations (AtomicOps)

There's no atomic or there. I guess you could use CAS. What are you
going to do if CAS fails? Error out or retry? Retry can fail
indefinitely and then what does the device do? Error out might be ok -
have driver slow down. You need error reporting though which you have
omitted because overkill.

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

