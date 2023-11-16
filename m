Return-Path: <virtio-comment-return-8396-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69022C197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:36:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AEEB842D71
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:36:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 87DFD986DDE
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:36:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 620D4986DD2; Thu, 16 Nov 2023 07:36:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50D7A986DD3
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 07:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: G-X2Kq-2N_OdO8v5xuhUvA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700120162; x=1700724962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfR7M8YBKNg2h1c5hAr3JuGfpXOhaSjzOj1Deo/cA/0=;
        b=XSiy2gHpswc7L5iEI1QMYHJOpC7USvdjOWHcJiTrq1DZdka+MROEV2UMlAT30ug8qe
         eEI0QfiKep+DuEJia89uNN/oM89jm2BXuOsjpz7AwAhUjK0AiUhSl6Wgm4+VFcUciOWq
         EzsIhkeVgIW/URPipckT1g1rfpQhTPulR+Sei59YA5ZVj21pHrGvdB/thTmeX55s0ohG
         5R4j3j3s9TfHt2UG2PpADQ4KgbfkaGZkK4uS9Iw43LhsnM82tEFYzSpI7DCsi6+tp7YX
         yCu38kT664GZxT9cXWLmrIUYWIQXQHE6N9lGSeDFBzpInjc8lSyMKYXLk0FxecG/iICq
         JfoQ==
X-Gm-Message-State: AOJu0YzZUVKNYS/foBXwXHkfOp7iP9xwAK+or7+56i6RAnk4a3qUYn/m
	pbLMGP4KMgMp2rS07/xv9+ke651IjVcaSpX3JSlWWbPmg/KoWGuoLD2MEO9vvYAr4XnZ/dnT9Pf
	Y3iJeJG+XU9xGwNUoBEp4+K9WB9uQ2UJW9g==
X-Received: by 2002:a05:600c:2217:b0:408:3975:e225 with SMTP id z23-20020a05600c221700b004083975e225mr12420943wml.40.1700120162632;
        Wed, 15 Nov 2023 23:36:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4/HzxrgzqbgptB8LzQUNpU5uAq1L8uLRJY6nqCvEH8XdoLod0MF+ydoRzOX48KTYgWxnQ6w==
X-Received: by 2002:a05:600c:2217:b0:408:3975:e225 with SMTP id z23-20020a05600c221700b004083975e225mr12420927wml.40.1700120162226;
        Wed, 15 Nov 2023 23:36:02 -0800 (PST)
Date: Thu, 16 Nov 2023 02:35:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231116023443-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231116004037-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Tsirkin wrote:
> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > We should expose a limit of the device in the proposed WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > So that future provisioning framework can use it.
> > 
> > I will cover this in v5 early next week.
> 
> I do worry about how this can even work though. If you want a generic 
> device you do not get to dictate how much memory VM has.
> 
> Aren't we talking bit per page? With 1TByte of memory to track ->
> 256Gbit -> 32Gbit -> 8Gbyte per VF?

Ugh. Actually of course:
With 1TByte of memory to track -> 256Mbit -> 32Mbit -> 8Mbyte per VF

8Gbyte per *PF* with 1K VFs.



> And you happily say "we'll address this in the future" while at the same
> time fighting tooth and nail against adding single bit status registers
> because scalability?
> 
> 
> I have a feeling doing this completely theoretical like this is problematic.
> Maybe you have it all laid out neatly in your head but I suspect
> not all of TC can picture it clearly enough based just on spec text.
> 
> We do sometimes ask for POC implementation in linux / qemu to
> demonstrate how things work before merging code. We skipped this
> for admin things so far but I think it's a good idea to start doing
> it here.
> 
> What makes me pause a bit before saying please do a PoC is
> all the opposition that seems to exist to even using admin
> commands in the 1st place. I think once we finally stop
> arguing about whether to use admin commands at all then
> a PoC will be needed before merging.
> 
> 
> -- 
> MST


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

