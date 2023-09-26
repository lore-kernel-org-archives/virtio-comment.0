Return-Path: <virtio-comment-return-7550-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AFFE7D27D
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Sep 2023 10:50:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 95D2B2AFFC
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Sep 2023 10:50:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6FDA0986413
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Sep 2023 10:50:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4BCCF983DE3; Tue, 26 Sep 2023 10:50:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9110098639D
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Sep 2023 10:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _QTr9GY6PviJgOLylB75xw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695725342; x=1696330142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KuwFR0wjVG6lK3Pke+FARvbN9oWJHChLuw9kA7KE1o=;
        b=VqYTFgtW0u1ukVt6bK/dzp3IGXrnO8DN5Rtn2I1vHR/FymsMDZFbQFe9KcC6d2x7r/
         EwIjnSmuQG9hqcqSFmnNHUmpUspPAykgzfUnzXLdYx+xo1lhwwepEB0+GCSZiCA7FsiZ
         aJcapJJ4KPRXMrckPgDxUz5IYl06b5oZJEzPQofCYEWZIbLApPifCTeDLKqFQn02nfqU
         +KZZYasi6oNeMNW3Mqj9lhAh/MZo0xFpJx2vnBrUuzmBZp/JucO5FhdRo/E6ai2wtS4C
         HmCT8/qkjdV1W3AGFTIA2quoh7gjVzf9K+679y5TKDYnpZXC9Ynnpb5m+cjXpsSNKX/f
         lIRg==
X-Gm-Message-State: AOJu0YzrENNnkdUwCZXuZuFjWXLVPrYtaVWef3qqOva4IqS/5OOsGRhI
	E2rnhqQLoIKmXyTsT6ASqV5yIBs1aoLR4VTaH8eUqfNdQy5MKYy5GZkKcNrPw7FgwyIIJapEB7U
	PUHIQMI2y6YbhSwHe9CKTZq+1RJs2GpUDcg==
X-Received: by 2002:a17:906:c143:b0:9ae:68a2:3bf0 with SMTP id dp3-20020a170906c14300b009ae68a23bf0mr9776567ejc.28.1695725342387;
        Tue, 26 Sep 2023 03:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH1vB5/vnr6wrsujDsLwK8mlaYlx8Dt50W068JlCr5ju7TG9sa4DckMfv7A0gZwmJlDP/5cA==
X-Received: by 2002:a17:906:c143:b0:9ae:68a2:3bf0 with SMTP id dp3-20020a170906c14300b009ae68a23bf0mr9776555ejc.28.1695725342109;
        Tue, 26 Sep 2023 03:49:02 -0700 (PDT)
Date: Tue, 26 Sep 2023 06:48:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
Message-ID: <20230926064201-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481830365A80EF4583A3FFADCF8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEshxAU3Mjo7vczBNRb=P=FnenO4mPb9HJL0Ma3ZRbe-oA@mail.gmail.com>
 <PH0PR12MB548172996D62E37714A9776BDCF8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtW88zJkDQL58NqLzzudq=f+SmzJ8bha55Dd2fd=FRGBQ@mail.gmail.com>
 <PH0PR12MB5481573D6EE3BE03FB7C3D70DCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvOxraeVB-5g7dJ-KBN=63kpmDfDdqaiQVyDh8egDjsGw@mail.gmail.com>
 <PH0PR12MB5481C11F6D68A892A091E2AFDCC3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e9c482d5-1441-fec5-b55b-f1ac6e81f85b@intel.com>
 <PH0PR12MB5481C57B255B0D5EA6FB109DDCC3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ddbd47c8-6985-2d08-bf98-0e7516f0c3c4@intel.com>
MIME-Version: 1.0
In-Reply-To: <ddbd47c8-6985-2d08-bf98-0e7516f0c3c4@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH 0/5] virtio: introduce SUSPEND bit and
 vq state

On Tue, Sep 26, 2023 at 05:25:42PM +0800, Zhu, Lingshan wrote:
> We don't want to repeat the discussions, it looks like endless circle with
> no direction.

OK let me try to direct this discussion.
You guys were speaking past each other, no dialog is happening.
And as long as it goes on no progress will be made and you
will keep going in circles.

Parav here made an effort and attempted to summarize
use-cases addressed by your proposal but not his.
He couldn't resist adding "a yes but" in there oh well.
But now I hope you know he knows about your use-cases?

So please do the same. Do you see any advantages to Parav's
proposal as compared to yours? Try to list them and
if possible try not to accompany the list with "yes but"
(put it in a separate mail if you must ;) ).
If you won't be able to see any, let me know and I'll try to help.

Once each of you and Parav have finally heard the other and
the other also knows he's been heard, that's when we can
try to make progress by looking for something that addresses
all use-cases as opposed to endlessly repeating same arguments.

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

