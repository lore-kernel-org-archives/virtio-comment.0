Return-Path: <virtio-comment-return-6071-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42443C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:26:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9318A41EE7
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:26:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7AA399867B0
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 16:26:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A5BE9867AB; Thu,  1 Jun 2023 16:26:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 565059867AC
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Jun 2023 16:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: bWW57yTsPiqZ1fdeWf6epQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685636781; x=1688228781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBxicmG8d8MVAKK0ONeDwOzummISOgMEv413HP2mrdU=;
        b=l22U5upcsOsRxtcSPVWmVCMlWzkB+Mn7LmYBIkHfJ6NQ44f0JU6UWvi71bZvCDKmZ0
         3eZMd9yuYvScSxNvKqZ5gYXXs9Wrf/BLOpvvQxTXPdRMVhtbvLhM6rQZipmdNw6cp6uK
         bpRJhDtFkj+5sdCVYpc+IKipl0EQ7lM5jo7EwypUZg3HT12G6jXftTJnmxUfXoCjmIva
         Udrf0HhrNVDzQtjKMqGIy1+TFbc/DN5Su8RF6lu331BlQyxacjkribcC8nVT7xxfaHMN
         MyKWPXIefSvQVt7wB115xp3t+SwtwS+Dd+CepvOE9JXOaxw8vG70simrplhaMq8HPIfu
         rExQ==
X-Gm-Message-State: AC+VfDxdNg+7Qvc0+auCQJVu3VoCM9uTg0b1wZae7FG3PIxUN7OngvJ/
	BPkPhUYRlS6JxTpnNqChAMAbHJdbZR9csXl1m9v08fPFavx4kd8Xm1hYbwumzEEwPNXH8a4jTRL
	FNP53DR9Q3nYysbxvJrN97uGqoQ2wAtXjwg==
X-Received: by 2002:a19:f806:0:b0:4f3:bbed:290e with SMTP id a6-20020a19f806000000b004f3bbed290emr329142lff.8.1685636780941;
        Thu, 01 Jun 2023 09:26:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61v8z2hMg7ZhzVB1qZcphHbg23fNWdFnUfmZpyOxqRVtXmo2djcmZSEfK20P2pMdt9aHlwWQ==
X-Received: by 2002:a19:f806:0:b0:4f3:bbed:290e with SMTP id a6-20020a19f806000000b004f3bbed290emr329130lff.8.1685636780579;
        Thu, 01 Jun 2023 09:26:20 -0700 (PDT)
Date: Thu, 1 Jun 2023 12:26:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230601122057-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230601121137-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54816AC81BE03DC46848B2C0DC499@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54816AC81BE03DC46848B2C0DC499@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio] Re: [virtio-comment] virtio networking collaboration
 meeting: call for agenda

On Thu, Jun 01, 2023 at 04:19:36PM +0000, Parav Pandit wrote:
> 
> > From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On Behalf Of
> > Michael S. Tsirkin
> > Sent: Thursday, June 1, 2023 12:14 PM
> > 
> > On Thu, May 18, 2023 at 12:53:56AM +0000, Parav Pandit wrote:
> > > For the first meeting, I propose the following agenda item:
> > > - discuss new virtio net device features for 1.4 spec release
> > 
> > Want to include a bit more detail here?  What do you want to discuss? At the
> > moment the only thing I see on list is inner hash proposal.
> 
> Yes, I would like to discuss list of features to go through at high level.
> In process of creating virtio-docs patch that we can review and store.
> Will send out the link hopefully in couple of hours.

BTW this is skirting the 1 week in advance rule a bit with such a vague
agenda item - the forum is about virtio net device so this boils down to
"features" then. Versus what? Bugs?  Just for once ok I guess but let's
not do this going forward.

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

