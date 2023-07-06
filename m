Return-Path: <virtio-comment-return-6740-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7EFEB64DD
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 06:10:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 06B207606B
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 06:10:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE7A498672C
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 06:10:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E602F986724; Thu,  6 Jul 2023 06:10:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D088E986725
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jul 2023 06:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: yDqelxDnMqixlCEoAefpjQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688623814; x=1691215814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akuF4yvADvDP2yHBTfV+EMwk9mnnynho/bRaZfcDiDc=;
        b=CaBpcrRwU7SrNqbzxta4YyRTYpxyCbPW21wVSzyRzSz7Hj9o5t/MO9VIRZl/qa3RsE
         vEam/sJ77082oSLDdcbt++IA9df6nCJ0jAh2PwxzJdCGAO+knripYyIJ8UOtym6p4fGP
         kMdL+5M98XELtXcLAp0anKPev8o/OQ8EgzkgpCk3qp+ZjvZI5Ouok05CCGW3YhZnpD4m
         ctooRIK5BMAAEZKwsspWhUBcgQgSbgHdG3uwth+0vrJ6VgBat/Vn0IMkfYLf+ZD2WG/A
         ZoAPkV4AhaYLjr5DJl0uOk2vFGJed1cH5WAQal+tN0AGtv5TJNeLxQQLQZGm6i/H+DsZ
         GsjA==
X-Gm-Message-State: ABy/qLbqdOIaRujq8jK5ArbszkVtIKehNJv58O4M5S4kiENiWDtFJ1dk
	EI9DuGT6rOFN7cjE4HKnrl6Ro6loOWM5EC2IgiqL9QSWwGnlOqQwbehOZKr9cz8pOOC8tdnUfCt
	XmWSTECHHu1H6CZr6fNDJ3dLOsukeiDlVcQ==
X-Received: by 2002:a05:6000:545:b0:314:3344:72f6 with SMTP id b5-20020a056000054500b00314334472f6mr705588wrf.32.1688623813946;
        Wed, 05 Jul 2023 23:10:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFbjaICPNH9Pg8ogZHrLrtARuLztQfY2locQUdYaVyhrqo+DQD+wNVOEdS5FikJ7SSUF3nGiQ==
X-Received: by 2002:a05:6000:545:b0:314:3344:72f6 with SMTP id b5-20020a056000054500b00314334472f6mr705576wrf.32.1688623813682;
        Wed, 05 Jul 2023 23:10:13 -0700 (PDT)
Date: Thu, 6 Jul 2023 02:10:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230706020803-mutt-send-email-mst@kernel.org>
References: <20230704233724.22394-1-parav@nvidia.com>
 <20230705070758-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D2368A718164DE18DCDCDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D2368A718164DE18DCDCDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v9 0/4] admin: Access legacy registers
 using admin commands

On Thu, Jul 06, 2023 at 04:20:03AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, July 5, 2023 7:09 AM
> 
> > OK I sent a bunch of comments. Pls try to address, unfortunately I didn't go in
> > depth over the last patch, but I feel it should be squashed into the generic
> > legacy command sections avoiding need for indirection, so rewriting it now
> > wouldn't be efficient.
> 
> I address all your comments and of Cornelia.
> PCI part I still prefer to be separate so kept it.
> 
> Thanks a lot.

I clarified some questions you asked about. Maybe v11 is justified
in view of my answers. Let me know before I review again.

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

