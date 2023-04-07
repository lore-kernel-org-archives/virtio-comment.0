Return-Path: <virtio-comment-return-5299-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6F5C6FD1D
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 07:35:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E9C282B151
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 07:35:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF5879865E3
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 07:35:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AD51E983F7B; Fri,  7 Apr 2023 07:35:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8263D9865D8
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Apr 2023 07:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -xDFEtGRNceTbNrZWmP0_Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680852858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dupmBcvSmkSTRYUDCDXAG5jfB3RiU20fR+rd9Zpsmao=;
        b=68mcky4CaYUMJ/drLUGxLPPob0UFjfGwbunILBJR1HCpoLrIwd95aEVuIStzNyjOse
         kj/4kLgKT90OM2d7yLmr6Up01EWsFgAJGK55ohT9+yfvcWfmdP/3IlA0XgTkOMZFFP+x
         j4iZcuvcAkHZ/CWsjASBAvLlvFBUYtA+qaUbyVuQpkkYG6uETtbe6m5tUtqORkYzl5Lh
         d/sz9wFBMl1ME/Skz/VJCE2yk/m9F7Wyf/wCO/R1rKBqAWPmqZ8a6t5cIzFtl6pO45Va
         HXZ3TNrLi9ZiRJTTAuCc70ld81dI8hNIHfa4awnroa9z2cf+OiuwrRAP2kI5SimMtPN3
         nNTg==
X-Gm-Message-State: AAQBX9cLuYJYqMgOl1Jx5RBZU0jirZOCbJcazU6Z/22VHkxraMXFvyk8
	ZTIEJ70dMiUkRBXf+5hLYBU/E2+KeRwjAkVDgo8KWRuQrT2+cdJBFIy/LWtthWzPrdejiUhYq+7
	jHzBbn+f4FoWtT1wus/iE3H9WyceFwFAaWQ==
X-Received: by 2002:a1c:770d:0:b0:3ef:f26b:a187 with SMTP id t13-20020a1c770d000000b003eff26ba187mr633073wmi.0.1680852857818;
        Fri, 07 Apr 2023 00:34:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350bWdGEDPjc77jkaXox3gDdIAxFZmmJCPU3A/nsFrjWjULtcx/fljhL95gXfO4nuqCqW0m9qbQ==
X-Received: by 2002:a1c:770d:0:b0:3ef:f26b:a187 with SMTP id t13-20020a1c770d000000b003eff26ba187mr633057wmi.0.1680852857525;
        Fri, 07 Apr 2023 00:34:17 -0700 (PDT)
Date: Fri, 7 Apr 2023 03:34:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@linux.intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
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
Message-ID: <20230407032731-mutt-send-email-mst@kernel.org>
References: <cover.1680533760.git.mst@redhat.com>
 <84cf421ad95111b37cddb52b2a7bf625b7955ae6.1680533760.git.mst@redhat.com>
 <0149d88a-196b-0bdc-32b4-1e01eb562310@linux.intel.com>
 <PH0PR12MB548174BC1333E7107B731108DC919@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548174BC1333E7107B731108DC919@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v11 08/10] admin: command list discovery

On Thu, Apr 06, 2023 at 02:05:07PM +0000, Parav Pandit wrote:
> 
> 
> > From: Zhu Lingshan <lingshan.zhu@linux.intel.com>
> > Sent: Thursday, April 6, 2023 3:20 AM
> 
> I have a dumb question.
> Zhu responded to these patches.
> Some patches have prefix appended as "virtio", some has "virtio-dev", and some have "virtio-comment".
> Whichever tool is adding it prefix, why it cannot keep the simple consistency?
> 
> Do we need to ask OASIS about it?
> 

Guess: are you using gmail?  Each list adds its own prefix.  Which is
admittedly a bad idea but there you are, OASIS outsources this and can't
change it. Adding a footer is an even worse idea but they won't change
this either.

So if you are subscribed to multiple lists you are getting
multiple copies, which is handy if each list goes to its
own folder. However, gmail is unusual in that it deduplicates
email discarding all copies but one. There are work-arounds
with filters but the end result in any case will be that
you will get one of the copies, selected at random.
As they have different prefixes and footers added, there you go,
a mix of different prefixes in a single thread.

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

