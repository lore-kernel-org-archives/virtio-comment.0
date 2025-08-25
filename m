Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2B6F9CB
	for <virtio-comment@lists.linux.dev>; Mon, 25 Aug 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756157904; cv=none; b=YHKUi6vo/Yxm9INlkjYXXI7IgoUbOfUZT/gjs2ojKYyQvFnW5tlgJHAmw4zv2KDg/D+owHN7+kHfpnlj3XYrLTwQBaSxHIN0q1LpRELqG0cS6UQ06zA9j2Ta+bEkgzlpOTjV2+J2JRnH1vH68gpA17nxt96ICcbV2xWPshpig60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756157904; c=relaxed/simple;
	bh=/29dmaBHrOwcqCdo6GUsmlBka0rq4E8XsbyJ7eHIyjQ=;
	h=From:Date:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pazY8ESRrZLcQWaOt3dogQFBbAh1YvbzNLI3B1A+OPzQtykd1wRHhukuq3czxdFbKSEi1soeEwcskGUIx7ACtJ/7W40tRHrXJEZT2ayuZAjPX4VKmvxZuGz1rDUSNdStLfPVxswIhMqzGQsraDUQUUUN3oUPwQbt5kGYhr9Z8v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DOdJgASv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DOdJgASv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756157901;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=/29dmaBHrOwcqCdo6GUsmlBka0rq4E8XsbyJ7eHIyjQ=;
	b=DOdJgASvEKZUc2Sf4huWqqWHVhA9CpS3b32L265S69gBrkXjac+oV1b7PyGsXl7gxQmwpO
	P2nKU1N4moDRBMMoM0tdAFv6FxNQb9+n2jOLVHDeYwSaYVxTmF6tuWX2sN9ck2rfppL53W
	Znom3rNW0rwyiB6MOr9/2Du9V/DB2QA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-o7Li_OxUNrmF32elKVjykw-1; Mon, 25 Aug 2025 17:38:20 -0400
X-MC-Unique: o7Li_OxUNrmF32elKVjykw-1
X-Mimecast-MFC-AGG-ID: o7Li_OxUNrmF32elKVjykw_1756157899
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3c8bc2914a9so840677f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 25 Aug 2025 14:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756157899; x=1756762699;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/29dmaBHrOwcqCdo6GUsmlBka0rq4E8XsbyJ7eHIyjQ=;
        b=HkP1PnRKJCO1ZqWlLdFX7WnkLy8hF5qcwvPb3TzLu2Mr4sOrhLbBroqSokZMpjndQe
         lwBukLLxV0z3dCwf+wTgPCkS89tIeVqvHz98sg3rZ6jVU+b2nelgIN/reCh4LP0VR6lC
         /2qu+Bob6NXzdTFIm2LYXWRhH91u80x1xcN6Jk3Z819uCCHR1ppp3QDFtCsLtYuSbzw+
         p5k6+UL2BdKJk9O6tbKPmqDBlfbYcEXYwbc7gDcSx+qUYwUxg8S6QgIgQqDRdJKwDxCe
         Yy3VEjotSwOcc6jYRTz88D/RI+TlICdCHfIqEOcUYDrjZxQ9+M8Cu/Dl9GWGyUOSdzpj
         syUQ==
X-Gm-Message-State: AOJu0Yz0TSeoFnxJIl2WiGTBVOxSaJcBJz2pECnszA0YBSWjOyVhtrOp
	DfQJyQfzl0BWkrLYhE+8vmd4Nx4xZYr2fR2TyOhkyNztrdJjsdAsmin0mdq1iG1Vi93RheWhvOV
	EFj/iIvaA1SAME01Q9OOM+mUTSs88pV16O7pTfBxC5lBc1V7H4STNl3fLfzFwDZzDvJnM+zeTST
	kczxcZ/SLU2eNEwMG+bq9145thPNF6P2vl9Dlk/424Q9A2hjgonsA=
X-Gm-Gg: ASbGncuSeBDn+PHMfPknwVdwcFyW7PWOAn84+2vQA/2L4T26+0WUP64/heOmZqyE3t+
	y6gCQ4P+xeJwF11boFA99Wiqn0xYYc7xbnFarvOW2RxpMpIIhuDAyqbBCwmoyxemSvxZpWpMQqG
	cPxyRzzp3ydQQ0psAK6CnZN+p91SDIUF/tcTIgaTGDUFJ0xzsFrfaElVXPXXcc4TNWWSL2jXRnR
	zK7+HVZvy9eYwC4z1AgbRWV/dv8HhHDajDg+ge9aYrdpPF1Q3KEp5c5w/497dQ28fUODgtdSXmB
	GF+l5tuhnVhRQiD2fdJvJG9J0mwoX8Lf1hz5WSF6GLWEv/iZFccsCg==
X-Received: by 2002:a05:6000:40ce:b0:3b7:899c:e867 with SMTP id ffacd0b85a97d-3c5dcefd9aemr11491330f8f.59.1756157898828;
        Mon, 25 Aug 2025 14:38:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8CyOih3C0bEgR/eHNNiMGgNdhPf4lHj2qF+5IpTXnM0WoU3Z8BRcvKdE17H/JTNvR7rb9kg==
X-Received: by 2002:a05:6000:40ce:b0:3b7:899c:e867 with SMTP id ffacd0b85a97d-3c5dcefd9aemr11491322f8f.59.1756157898362;
        Mon, 25 Aug 2025 14:38:18 -0700 (PDT)
Received: from redhat.com ([185.128.27.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b57498d8bsm124819105e9.25.2025.08.25.14.38.17
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 14:38:17 -0700 (PDT)
Sender: Michael Tsirkin <mtsirkin@redhat.com>
From: "Michael S. Tsirkin" <mst@redhat.com>
X-Google-Original-From: "Michael S. Tsirkin" <mtsirkin+test2082025@redhat.com>
Date: Mon, 25 Aug 2025 17:38:14 -0400
To: virtio-comment@lists.linux.dev
Subject: test2092025
Message-ID: <20250825173721-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: crSKXhIJceXvuHxXVOe3EucA97KE1Gmg208LsIlU4PE_1756157899
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

pls ignore, sorry about the noise

