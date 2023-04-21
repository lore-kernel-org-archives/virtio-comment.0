Return-Path: <virtio-comment-return-5567-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34126C7618E
	for <virtio-comment@archiver.kernel.org>; Fri, 21 Apr 2023 05:43:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7E5441FF63
	for <virtio-comment@archiver.kernel.org>; Fri, 21 Apr 2023 05:43:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58E2C986636
	for <virtio-comment@archiver.kernel.org>; Fri, 21 Apr 2023 05:43:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4771F983FEB; Fri, 21 Apr 2023 05:43:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32E2E986637
	for <virtio-comment@lists.oasis-open.org>; Fri, 21 Apr 2023 05:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: l8q_3_H5N7u3qs6GS1JR7w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682055825; x=1684647825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3pbInikhMeZSfdaxQvw+Ul7ae3bI6PoC4SdBdK79ac=;
        b=fB+75MRUFXXBPjwQm5/uDzymzTKjpw3MXOpk6Odbr9XHZ8Uz1Dz1BsWBV3p9xKqguF
         b6/J14l+hYh6JEHMEvOppKFIOtCsBMqcu0/ZrVjMKdUez49NyxO/WpUMe7kuc9JgAg7d
         epCkThS4QNjc8GOBpI/IJuqoI2DoshxreBmm2xl8B+C3+5ASDodg7PyoQh2NvgXAZIwE
         a8nSFaCJK0NY+mNyVbCnDPzf3vOh6NvXR7wZ8nvKxF9Go6zgnCPlDHmSoDnH45M96Fqs
         afNp2gthzvDIpX05FNSSFDwkP8nrF3gfK0vVL0XxFArRv3xMgHdMZthmAGHrs1HXXQ6k
         02zg==
X-Gm-Message-State: AAQBX9dQC8R2ALTHIzgQBywvS8rvlxLjJOeWs+ukrn3XNzxICVFrWLEQ
	toHTsC1EYgUgXiy+mnhiRtcAuCadDq3hwz4VUiUP3kDonkHeLeFdi9FD/JmCXNxO+UGc1b+tmor
	2uIZK/wWDrIDEUL9FuL2TsrsrnX1jdtOdPA==
X-Received: by 2002:a05:600c:24cd:b0:3f1:73ce:e1dd with SMTP id 13-20020a05600c24cd00b003f173cee1ddmr800192wmu.10.1682055824990;
        Thu, 20 Apr 2023 22:43:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350aC/Tux1oNoEUaqWQomhRYVtHmmHvuxCO8tIa7cU6+5R5lKcV6tUFW5bkywUeQN4SPMdvYoWA==
X-Received: by 2002:a05:600c:24cd:b0:3f1:73ce:e1dd with SMTP id 13-20020a05600c24cd00b003f173cee1ddmr800187wmu.10.1682055824682;
        Thu, 20 Apr 2023 22:43:44 -0700 (PDT)
Date: Fri, 21 Apr 2023 01:43:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230421014212-mutt-send-email-mst@kernel.org>
References: <20230420195158.69737-1-parav@nvidia.com>
 <20230420195158.69737-2-parav@nvidia.com>
 <20230420163800-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548172381252BEB73CAE6D44DC639@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548172381252BEB73CAE6D44DC639@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 1/2] transport-pci: Improve config msix
 vector description

On Thu, Apr 20, 2023 at 08:51:57PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, April 20, 2023 4:45 PM
> > >  \item[\field{config_msix_vector}]
> > > -        The driver sets the Configuration Vector for MSI-X.
> > > +        The driver writes the MSI-X table entry index in this field for
> > > +        Configuration change notification interrupts.
> > 
> > 
> > Urm not exactly. there is also a special value of 0xffff.
> > I feel this here is just a high level description.
> It is high-level description. 0xffff is already covered elsewhere in the doc.

So make it as brief as possible then.

> > how about
> > 	Used by the driver to set the MSI-X vector for Configuration change
> > notification interrupts.
> > 
> > pci spec also calls the entry "the vector" so I feel it's ok.
> > 
> 
> To keep the text consistent with rest of the fields, how about
> 
> The driver writes the MSI-X table vector in this field for Configuration change notification interrupts.
> It uses a single verb instead two = "used" and "set".
> 


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

