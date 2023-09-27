Return-Path: <virtio-comment-return-7566-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDB5E82CA7
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 15:40:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C20186030B
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 15:40:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B48D698667B
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 15:40:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AAB7A9864BB; Wed, 27 Sep 2023 15:40:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 98E969864A3
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Sep 2023 15:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8TPVbFR7MeOHiEnUJrEQRw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695829218; x=1696434018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7l/ioskZAEN6huBPEyEucqQUg6jxkjeaFuSkDBjneo=;
        b=rjqogA2fjTCfc4P4j/UjMUeRw0qN/+YEq5Srw/HWmKK/uwk61erg7DTpjf6288RPM7
         NMp2Db1ntyZwL41jya+4/ZmwjEShss8KHWqaZWHatLZMQN6GGfnEM3yUl+gWKpSH3btU
         E183fpW0lQ/qFXKvK0FF7GuNwNXCll6JWhEvnrg8xr28fhlYjQPprTsq1vE/1K4zt+CD
         N7GmkPejXVJuuFvHEY9+BTgWcUCIEPRYw9UF7U+LyphdX/FM9DX7nnckavwDmern7/vE
         fscX9wqkVjgviAbC/1oKzvfBukcNXQpBqGqxtsAS55eGS7yrBwTG8HnkSQ1FDEmi0vhQ
         JH9w==
X-Gm-Message-State: AOJu0YzBU59VOhKyA3Z5yVwTXcXil9swYv0ObOjxl+yTGuQgD6jtg9rZ
	69V/ExzIJKkouGlbxiUJ0T1NY0W7J6c6K/mnFwBfES0ztmsw+qeIkm4nQ6sZUioUwRwBxh99EYa
	iYW0cc7gMDY2g5b1kt4Gwr1mzJd2PSKF8qQ==
X-Received: by 2002:a05:600c:5120:b0:406:44e7:bf84 with SMTP id o32-20020a05600c512000b0040644e7bf84mr1995114wms.9.1695829218107;
        Wed, 27 Sep 2023 08:40:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvqaGAASddKanYCsXWE+eKBF5YiQB+wzIUQdabhXjqFDCtw5sxWX3xOrt4z63Vs0yD2bhCnQ==
X-Received: by 2002:a05:600c:5120:b0:406:44e7:bf84 with SMTP id o32-20020a05600c512000b0040644e7bf84mr1995097wms.9.1695829217754;
        Wed, 27 Sep 2023 08:40:17 -0700 (PDT)
Date: Wed, 27 Sep 2023 11:40:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Jason Wang <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
Message-ID: <20230927113510-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548172996D62E37714A9776BDCF8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtW88zJkDQL58NqLzzudq=f+SmzJ8bha55Dd2fd=FRGBQ@mail.gmail.com>
 <PH0PR12MB5481573D6EE3BE03FB7C3D70DCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvOxraeVB-5g7dJ-KBN=63kpmDfDdqaiQVyDh8egDjsGw@mail.gmail.com>
 <PH0PR12MB5481C11F6D68A892A091E2AFDCC3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e9c482d5-1441-fec5-b55b-f1ac6e81f85b@intel.com>
 <PH0PR12MB5481C57B255B0D5EA6FB109DDCC3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ddbd47c8-6985-2d08-bf98-0e7516f0c3c4@intel.com>
 <20230926064201-mutt-send-email-mst@kernel.org>
 <305d9907-9668-d362-1ff2-49a5e9f90e42@intel.com>
MIME-Version: 1.0
In-Reply-To: <305d9907-9668-d362-1ff2-49a5e9f90e42@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH 0/5] virtio: introduce SUSPEND bit and
 vq state

On Wed, Sep 27, 2023 at 04:20:01PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 9/26/2023 6:48 PM, Michael S. Tsirkin wrote:
> > On Tue, Sep 26, 2023 at 05:25:42PM +0800, Zhu, Lingshan wrote:
> > > We don't want to repeat the discussions, it looks like endless circle with
> > > no direction.
> > OK let me try to direct this discussion.
> > You guys were speaking past each other, no dialog is happening.
> > And as long as it goes on no progress will be made and you
> > will keep going in circles.
> > 
> > Parav here made an effort and attempted to summarize
> > use-cases addressed by your proposal but not his.
> > He couldn't resist adding "a yes but" in there oh well.
> > But now I hope you know he knows about your use-cases?
> > 
> > So please do the same. Do you see any advantages to Parav's
> > proposal as compared to yours? Try to list them and
> > if possible try not to accompany the list with "yes but"
> > (put it in a separate mail if you must ;) ).
> > If you won't be able to see any, let me know and I'll try to help.
> > 
> > Once each of you and Parav have finally heard the other and
> > the other also knows he's been heard, that's when we can
> > try to make progress by looking for something that addresses
> > all use-cases as opposed to endlessly repeating same arguments.
> Sure Michael, I will not say "yes but" here.
> 
> From Parav's proposal, he intends to migrate a member device by its owner
> device through the admin vq,
> thus necessary admin vq commands are introduced in his series.
> 
> 
> I see his proposal can:
> 1) meet some customers requirements without nested and bare-metal
> 2) align with Nvidia production
> 3) easier to emulate by onboard SOC

Is that all you can see?

Hint: there's more.





> The general purpose of his proposal and mine are aligned: migrate virtio
> devices.
> 
> Jason has ever proposed to collaborate, please allow me quote his proposal:
> 
> "
> Let me repeat once again here for the possible steps to collaboration:
> 
> 1) define virtqueue state, inflight descriptors in the section of
> basic facility but not under the admin commands
> 2) define the dirty page tracking, device context/states in the
> section of basic facility but not under the admin commands
> 3) define transport specific interfaces or admin commands to access them
> "
> 
> I totally agree with his proposal.
> 
> Does this work for you Michael?
> 
> Thanks
> Zhu Lingshan

I just doubt very much this will work.  What will "define" mean then -
not an interface, just a description in english? I think you
underestimate the difficulty of creating such definitions that
are robust and precise.


Instead I suggest you define a way to submit admin commands that works
for nested and bare-metal (i.e. not admin vq, and not with sriov group
type). And work with Parav to make live migration admin commands work
reasonably will through this interface and with this type.

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

