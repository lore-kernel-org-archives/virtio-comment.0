Return-Path: <virtio-comment-return-5595-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6FFC77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:30:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 006122ACB8
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:30:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB8B798636F
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:30:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E44B1986350; Mon, 24 Apr 2023 16:30:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D483E98635B
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 16:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: CfbpUjMzNbWofBDWU1n6iQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682353830; x=1684945830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LK4kq/ILZQw9nUucyG7B+O2UQyQ12SxHp8soyLFrBk0=;
        b=X+QfLfgEn6niVV+oDqaHE5BMpDDEV0rMwV+yhHGq3WvqAeNt7Yax6EA4dYuTrzr/rB
         mJCTsxgx0yN9JdgjpnNakcKPfXqD6L2nvWefQQ4IC/uXfp9jjqz+KNHP99C6sLsv0Vuo
         mvooJZJ+CpLX5QY3XS1uyhaUWRwy4LwkCBiw08IDjK96EGa3F/nmkr1rgvCU5qD68DfI
         Lgg5IU3+eZW38sn8hyA6t/sR1AqDyq0lgoLPFVZTPVzJNskQVL/P6uZEZjGC4eyLWWof
         9vXRyMYTSEv/lApTDW1DLDxxhDTYfoEhLX/HDP2O7yDq2JgV09p1gj2HSIqPh3B+VLGY
         OWBw==
X-Gm-Message-State: AAQBX9cSxNQY0uOBafkA1LCwIWvAVzd7XhK49TzPYOqky52dAdYsvKm7
	2fyDr1vVSCoY7x6XeE0oppfwau0fL4Rc3UgoAqoKf/zwh0+J+l7Rh9inAyrizgwsjcS0ZiByPQ1
	2Ag2VhPp0V6iS4xHAR83oc5sh4l/5eJRsag==
X-Received: by 2002:a1c:770d:0:b0:3f0:8fb3:24ea with SMTP id t13-20020a1c770d000000b003f08fb324eamr8195393wmi.9.1682353830783;
        Mon, 24 Apr 2023 09:30:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBApl0QSY0e6tN2tWJ2q4lsnY6qRO82K2aS3+2Ovx1TGlns1nti/aJXT21aC4WNDZdl19nTA==
X-Received: by 2002:a1c:770d:0:b0:3f0:8fb3:24ea with SMTP id t13-20020a1c770d000000b003f08fb324eamr8195367wmi.9.1682353830458;
        Mon, 24 Apr 2023 09:30:30 -0700 (PDT)
Date: Mon, 24 Apr 2023 12:30:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Jiri Pirko <jiri@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230424122858-mutt-send-email-mst@kernel.org>
References: <cover.1680533760.git.mst@redhat.com>
 <f83a6a225a28909eea927575b6783c0fe238fdbd.1680533760.git.mst@redhat.com>
 <ce6437c5-0cb6-f1a9-d978-b8084c95c552@nvidia.com>
 <20230410092304-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548178169DF16AED534395EEDC959@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548178169DF16AED534395EEDC959@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v11 02/10] admin: introduce device
 group and related concepts

On Mon, Apr 10, 2023 at 04:42:42PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, April 10, 2023 9:24 AM
> 
> > > From this point onward you can add,
> > > --- line. So that it doesnt go to the commit log.
> > 
> > I can but motivation for design choices is a good thing to have in the commit
> > log.
> > 
> Yes. 
> Righting it as
> Usually, I see those design notes or rationale written as third person sentences.
> 
> Also, since those design choices are good to capture, can we start cover letter commit also, which usually give a complete or broad view of the design?

too much beaurocracy really imho.


> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

