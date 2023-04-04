Return-Path: <virtio-comment-return-5199-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE93C7618D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 06:33:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9CFFD23D57
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 06:33:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8049F986400
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 06:33:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A1F29863E4; Tue,  4 Apr 2023 06:33:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5335D9863E6
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 06:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: T6wvQjbzPoW2LwzuvUhrlQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680590000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok5lwzPGeUNv0NHclJghBxK74E1IF2gmAJlYAs6xPy4=;
        b=ZQk81O1UfjCwPGw99/9d4QE+1wlC+2JjW9m4Rim+4rcR69lU7EuisWYLUokmo9a9Sd
         s2BrSRwOnjWA8188k9Wuj5DwthIhDxtJWSb0yYLfuMLu/fBQ3h9rU7+x8FAXghE3asjX
         cyr9pE5DUdxw2EOrOqrEn7euMRxyDAr/PnuR4B7lPD4qkvufVlXErZ8vsaiOZ2E0Ww+R
         UluybUA9x/J7ySGTIeqOClJWppD9crJ50tvVAVCbEfcIwVRV2ZTydV2saNLuliZJXvJK
         WUsX1KUXSmgaV+mENYNfGkn3qyh3o09hRGlvAUy8DaSZR9Rw9LgISJk5clpV1zg5wF7R
         0cxA==
X-Gm-Message-State: AAQBX9eoKQ4ilNnOdkWB9GO3eAmLN1fDylKQFoWvPfnzMn0u37TgAOlR
	Jp6Mjb/1W3623+nIBUnxFJjDPCHhXad/mnAQhV2+Cf05TYkMWg4gFvH8UEramBhkjAyjjk3xq02
	maTz7KCY56RseqF08TaWQ43+c728kYLhX9g==
X-Received: by 2002:a17:906:6987:b0:92e:c4c9:7a43 with SMTP id i7-20020a170906698700b0092ec4c97a43mr1223804ejr.25.1680590000045;
        Mon, 03 Apr 2023 23:33:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zo5WWQ1H52m3YcQu6pnGQRiuZjgysxYjPpNS00Bt5M9cMjLSYNcZ/f7tl6E0MwpKU6xKmxTQ==
X-Received: by 2002:a17:906:6987:b0:92e:c4c9:7a43 with SMTP id i7-20020a170906698700b0092ec4c97a43mr1223790ejr.25.1680589999771;
        Mon, 03 Apr 2023 23:33:19 -0700 (PDT)
Date: Tue, 4 Apr 2023 02:33:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230404022928-mutt-send-email-mst@kernel.org>
References: <20230329212341.465843-1-parav@nvidia.com>
 <20230330191114.77acd860.pasic@linux.ibm.com>
 <PH0PR12MB548165C4B11375F8C7EE7AD1DC8E9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230404033622.4b749f89.pasic@linux.ibm.com>
 <d62d2090-de0d-0ea6-5c85-ecf19ae828c7@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <d62d2090-de0d-0ea6-5c85-ecf19ae828c7@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v10 0/8] Rename queue index to queue number

On Mon, Apr 03, 2023 at 10:57:35PM -0400, Parav Pandit wrote:
> > Both solutions are equally consistent in themselves, but I
> > argue the latter is better because:
> > * it is more consistent with historic usage
> Well index/vqn has mixed up anyway now.
> For historic reason, I agree that index is right.
> But it is too late now.
> Comments have not come on time.

Why, is there a deadline? Is this blocking some other feature? For
something that is supposedly a cleanup we might as well get this right.
If you guys both agree index is better, and at this point it sounds
convincing, why not do it? It's more or less a machanical replacement.
It's not like there's a lot of word smithing going on here except for
8/8 which really works with index just as well.

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

