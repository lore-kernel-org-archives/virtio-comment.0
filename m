Return-Path: <virtio-comment-return-5232-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BF5C6FD1D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 19:08:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 73BCD2B06E
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 19:08:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5731198658C
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 19:08:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 459E4986524; Tue,  4 Apr 2023 19:08:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 35BE298658A
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 19:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cjnnje28OJqsMuRc_Uq2wA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680635304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCH1lFA9IIYGetreEhigBYkX3QHNz6MTurP0gBeQ7mQ=;
        b=0p/KYaMGD6rmqXFpK8rob1gCQIWYjzKO3ynJzNCcac7sWFr05gsc8+1VADJMvPVTJa
         hIrM2Bu0zZxT5xIK5d+3mouX2mepUVl/0mSoNiaEFh7s5WBTrVe0bOSgnFT1FwAJusCg
         x3hFWMm4h5uC1ceEAbMzpaGb0DBOdaljQ3r4V5AB2ADIkmQG+55nQFQ+XDbau84xIROP
         h4eDmSDmuHMBQwg3cPKrkTJ8+wZ4XfVyN64haf1Q07FlrjjFoAuzeSASawsC9bHBL9uz
         xA+yJrDWnmHgWJNo/LNuCJBMyG7Psm0sROCT579bYBnd4TC4OJv4OJ0+szcDpxjPKe2H
         IePw==
X-Gm-Message-State: AAQBX9ecMYZ0imUCyVyRMmLpZIp4yl+iZgcNyXFWTPRGS/7wpOKjnKyo
	Z7vfAcLjbDMA+yJsaB5ZvUp1HmRvlUovG5AY85wGYRYfPgtAUBKOboWYJc5MdchG144nd9D6CrB
	DUpAS8FmFNjHfEQU6NxqASfRm7pEnlKK84g==
X-Received: by 2002:a17:906:ef2:b0:93f:9ef3:945b with SMTP id x18-20020a1709060ef200b0093f9ef3945bmr653613eji.17.1680635304118;
        Tue, 04 Apr 2023 12:08:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZTNnmnUL48vQHLb7AE3HnshDCYMLShwbCrWVBHjRboyyuVMDFIgWL+HZesH2VCYFfjrDbV+A==
X-Received: by 2002:a17:906:ef2:b0:93f:9ef3:945b with SMTP id x18-20020a1709060ef200b0093f9ef3945bmr653595eji.17.1680635303852;
        Tue, 04 Apr 2023 12:08:23 -0700 (PDT)
Date: Tue, 4 Apr 2023 15:08:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230404150555-mutt-send-email-mst@kernel.org>
References: <20230324013534.280820-1-parav@nvidia.com>
 <20230324013534.280820-4-parav@nvidia.com>
 <20230404031723-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548194B8F1C22EEB74164ABCDC939@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548194B8F1C22EEB74164ABCDC939@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 3/3] transport-pci: Improve queue msix vector register
 desc

On Tue, Apr 04, 2023 at 06:14:20PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, April 4, 2023 3:21 AM
> 
> > Ok but "receiving" is confusing here. And the verb writes seems to ask for
> > direction, look at queue_desc as an example.
> > 
> What is the confusion in receiving?
> Driver some reason is configuring queue's vector even if it doesn't want to "receive" interrupts?
> Do you mean it is more verbose?

I mean driver does not even receive interrupts, APIC does.


> Word here "here" isn't necessary when describing the register itself, though it exists at other places.

if nothing else let's be consistent. without here it is not immediately clear
weather it's the register that is written to or the value specified
is written somewhere else.

> > Following that example:
> > 
> > 	The driver writes the MSI-X vector number used for virtqueue
> > interrupts here.
> > 
> Since a specific number is used here, article "an" is appropriate one.

No because it's the specific value used for interrupts.
Again, check other examples.

> > would you agree?


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

