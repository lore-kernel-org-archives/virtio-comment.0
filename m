Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A74A69959
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277986; cv=none; b=SgdxaNwjzkaQ25gHgcNbIrnw6IiwZRNMhFLDRtXxSnHniv0pKBVCO+OJ5OSXMlDLZMb055lVpoT6yk48vnbVsdb6X828ldTQKYNsWtgYqlKPWIYG0xnA9j4yUX7uKc7j+Nkbz21qFDg4YiZ9uyHoaF/dsFB7Z+1mzXUVwKoAbNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277986; c=relaxed/simple;
	bh=HglLj7VG+CJN3Zu2VRG4L8jj8H2P2Slq/rgTyD6TyUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sn/TWZzADl21RmUNuj2pANd4kHaUhhcQcpLfYDRv8pGefUWTGsBPrsNfk5EFGUPMraxK4CnFgGyX0UQKcEwm1H0RO46ajRF5ge+xoBdTBXN7ffGJVp77RL9yDj6toyOsMFWs5l3qT2hVhdF/8plBpSa8UNOxqBTzmqvM1P1CA+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bdDFi9JA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bdDFi9JA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718277983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=eGLgEaAPdvQTVgTWMGd3qxRu4ypFHObXzU/YkDmDLuA=;
	b=bdDFi9JAPSaC0fMbOOaGHVEF9elocLTnRGmuIkKIhqAWMM6ELVGvZmuYYAmWn+JnfApgIL
	4fv9YtRssrIZ7bluTAXLgjpHupFik848G4xPGSGYE+xy6xu+tRn0YYZnB0og9Pxgb5s9Te
	7iVffjSC2BVAozN7PZszkRNOEveoN8Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-uq9-_8NzOvSKpbN6dJhi7Q-1; Thu, 13 Jun 2024 07:26:21 -0400
X-MC-Unique: uq9-_8NzOvSKpbN6dJhi7Q-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-421179fd82bso6248595e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 04:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718277980; x=1718882780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGLgEaAPdvQTVgTWMGd3qxRu4ypFHObXzU/YkDmDLuA=;
        b=AGW6fUd/9mu0Qa/q7YB4JtHQ8peQecK5tzoIpNJfXqal00f3ownG9mDK8toQ8FmagP
         2i8pKJ6CMk5JNxttNhP/+Hj6CAMmNhNb1Arj0Z1/zLIReyvH8rDKrwaEQf92wWJ2t/3r
         9/qEqGYbkpq3NbFsf9BJohfeejMd3cKJXILYlexOmCHx/uvWhOrgnVdSV8UzGJi5FsZ/
         OqtQ3goE2YGyG3k3LkSIq8T0jIGHoucaWeEe3bBbajy8u2poI/11oQ3z/U/pXaqYmubd
         9MJu18UOrYS6NzyCSCwqFCx7GMw1zvzljsj+rbdFAOA/fsnq5Wp/IKOa+xv+iXPWcz/C
         uFKA==
X-Gm-Message-State: AOJu0YxbTyOL7ti1t0599ppn+OYxFvwhtU5cjBHRuhUOIYtjMcc0AwMy
	OOh0VpFjqRBJ8fLyY0RaakZusfGHpotQos7kEqOY/EIPL629GCgyZaN9r5OMLqRoeHLeVj//X+V
	D/kPyU4JIttavRXpL1QnC58506U+oBRkx+i2xq6McJ57Bh+GW109qi5u3MOy/wu9qCmY0qj1ai8
	CFoUdI6vYnlr+LjD/Zc4Ep8NIVaE+YnoFlaaG+t+vhBA==
X-Received: by 2002:a5d:634b:0:b0:360:712e:3602 with SMTP id ffacd0b85a97d-360712e3a34mr2201884f8f.41.1718277980139;
        Thu, 13 Jun 2024 04:26:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELmaE6NlU4UUdPqOVNImzIygSOcnXSudYs6ZkkgFFc3nMdEvKv1tH/FG+ZznBEesr+gPtmUQ==
X-Received: by 2002:a5d:634b:0:b0:360:712e:3602 with SMTP id ffacd0b85a97d-360712e3a34mr2201849f8f.41.1718277979338;
        Thu, 13 Jun 2024 04:26:19 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:5539:9b1a:2e49:4aac:204e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f22a0sm1428900f8f.84.2024.06.13.04.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 04:26:18 -0700 (PDT)
Date: Thu, 13 Jun 2024 07:26:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Heng Qi <hengqi@linux.alibaba.com>
Subject: re Issue #194: virtio-net: clarify coalescing parameters settings
Message-ID: <20240613050316-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!
The ballot on issue #194 is set to conclude however some comments by TC
members made me think some members were confused about the voting
process. In particular two members abstained leaving
a comment which makes me think they were actually against merging
the proposal.

I would like to clarify two things:

- 1.4 release (for which this is targeted) is not imminent.
  there's no reason to merge a controversial patch, we can
  work until there is a rough consensus.

- even with a non released spec we do try to maintain compatibility
  so it's a level of commitment to accept a patch.


Further the ballot was part of a big batch of 5 ballots
at the same time, and the description in the commit log
and the text itself do not 100% align.


Given all this, I am inclined to let the discussion go on
a bit longer, and re-do the vote with a new version
of the proposal.


Objections?

-- 
MST

