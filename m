Return-Path: <virtio-comment-return-5874-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354E7C77B7C
	for <virtio-comment@archiver.kernel.org>; Thu, 11 May 2023 13:38:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 62AEE603C7
	for <virtio-comment@archiver.kernel.org>; Thu, 11 May 2023 13:38:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 483739865E1
	for <virtio-comment@archiver.kernel.org>; Thu, 11 May 2023 13:38:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 364029865DB; Thu, 11 May 2023 13:38:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 21D229865E0
	for <virtio-comment@lists.oasis-open.org>; Thu, 11 May 2023 13:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: B383iIC8PZubUGy_DA44wg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683812316; x=1686404316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12kV18AwJLUhblqwX6DZLFvhFrDNYODhQue7xEOiGUk=;
        b=blJPpKX8pDrrvp4hUfaPTnOLK7rcUqbeK9eEsxznbIJlp1pjsUWE415xMLtxcnHwem
         BL/xgOYN70WwIrB8RZQAlgBCjqlyaEZmp81EaBnLYa87MsUL+em1a+rHy6K/2nw1XvtE
         wRoWikjJs/drBZW4+ND+AQGcGmWsbdTg1TXN1+xeKMrSRmkFAEa00AvIAsHVBLfoYiAq
         HOOOO/+4QdSoe8JS6o0SxIees1dldlJfzGw3H1vEYgy3D6KnOhhPcGQwUjlsuLQ1gX/P
         uhs7TH+1K240/oY38laPFUVVZgZ9R/WXmKXcLthfKE+WcUBm3s2g4Y4+lBRnFat/sOcP
         i+iQ==
X-Gm-Message-State: AC+VfDx7iirmDtucDvAJNSQWvGCIqc9faD5lWQKXTwqo9vvSj2YckiAr
	2EL7ln1vJ1HzVVtuaI2i6iOHP+VzYfgASAGu0FR6Sxi2ajG9gatBEJ5uPiRecxwT8WZ8LwDDIlU
	9kNZFydUagfJFx4hO027R1V7hKmXmFO2o3Q==
X-Received: by 2002:a05:6000:48:b0:307:7c2d:dc79 with SMTP id k8-20020a056000004800b003077c2ddc79mr15237997wrx.16.1683812316108;
        Thu, 11 May 2023 06:38:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wCgDgEGJreuNonYHmSz6pn/WlctK1VytgPdEx4Y1mPT2QD7AYji/VyC6dQ6Smhreur0X/gA==
X-Received: by 2002:a05:6000:48:b0:307:7c2d:dc79 with SMTP id k8-20020a056000004800b003077c2ddc79mr15237977wrx.16.1683812315816;
        Thu, 11 May 2023 06:38:35 -0700 (PDT)
Date: Thu, 11 May 2023 09:38:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230511093309-mutt-send-email-mst@kernel.org>
References: <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org>
 <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <20230510014534-mutt-send-email-mst@kernel.org>
 <43ec1c8d-7d11-2400-3649-1fe366b1e21b@nvidia.com>
 <20230510121417-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F030A76141320F03956EDC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481CEB307F413E53B03D502DC779@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtm5AS50YmPi6A5=gzZZ9Jm55NEJ3GKOTzv-Z0m5E5J_w@mail.gmail.com>
 <PH0PR12MB5481DE0569EC53A862A4D2E9DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481DE0569EC53A862A4D2E9DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ

On Thu, May 11, 2023 at 01:28:40PM +0000, Parav Pandit wrote:
> This is not the objective to transport all PCI virtio fields over AQ.
> Transport VQ commands proposal commands and commands in this proposal are just fine the way there without quoting it as "transport".

I mean, it's a transport in a sense of where it will reside in e.g.
linux virtio stack - below virtio core.
We don't save much code there by reusing the same register
layout of legacy pci.
But let's at least make this feature complete, and then we'll
see whether it is cleaner to reuse legacy layout or build
a new one.

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

