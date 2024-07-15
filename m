Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6C1CF92
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062188; cv=none; b=IX9F6g3Sc3WcEaqKF9GwZoLTlJbjT48WAfvw5Ef/bobAKUDqxXGDlMvnu765OoB2kXgT2Qf67t3dikiMbrn8KGz4c/W5T3yS9aXc5n69r6E4YLm+7Tj5Tq0hIKBeorMid59VwlFMHvsI9dePHWMulupgEJtzufRA2kbXVSqCQLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062188; c=relaxed/simple;
	bh=nbsYoozf/3sk1ltDXBm0KlPtIod+fyUWn2/5yIkBqHE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eYZAlfsawX7XPUvtcicqFjBin/ldBwcLB8DGMHYjN+VQHCTwb9mPwMuLrybdxEIV8j63CHtaUYMNvoXSasdQ75O3CH7sMzoFtFjVaqRzd6gTGbEfCWjeFXeNyZwN97XtgNQy5xATAgln8quCgUEuKvcF/pO/0+PYC/r4D/Fl9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DXoPk5L2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DXoPk5L2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rz46CqlfdldNQYNqdJ4pxSripeIy+8SVFLT6isMFh9c=;
	b=DXoPk5L2FVlTytP8lo9k/wi1PsFJZhklH3+J/3Ik+aKlCG0KuIq9iaIylswnsJxVhlCtcS
	7kfZbkovl2VXSNLmbQjprjyGq1dufKRQHVUEeTvT9yQIa9ZTNdIKio2nczgAK7hsTM95uC
	TroQNNXe0fm6gqw0RuLBrnfK/0e6ibY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-fyS_MyjgNbCPgUxCI_crMw-1; Mon, 15 Jul 2024 12:49:43 -0400
X-MC-Unique: fyS_MyjgNbCPgUxCI_crMw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4266fbae4c6so33598665e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062182; x=1721666982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rz46CqlfdldNQYNqdJ4pxSripeIy+8SVFLT6isMFh9c=;
        b=idj4U0Z/ID1yT8Pd7Ho5BmTy/vm0x4j3EXVIhe3l6uB+BfkFZJJMFjqmr+wgmwX7Jy
         6e6IE5s+qS0EMx4RDAApQ35IwL6NdLisgjnJusqLORexkdk/gPMM/hqrECYcJrdZSWaf
         C2a588kcfaHSHe/f8q42OFft6JwaCcGeCWuMO4yyuiORYRFA2c/o094MN2A9vIcISLOs
         gQcSiKtI9UFhWjhulJQIqoN/VXz5lGhoNtoDeQQ+zxFXFp8gxNEL0LwOP260/3hQGM1h
         dWFhYRu3FuS9Hd3nSQljPQ9TdOjZvEXS/60q2B4qpOzDxFWDr6BH2tvJu9rwgDSwu8l0
         6k/w==
X-Gm-Message-State: AOJu0YxPCSvWGocz54q5a13GpzRA9n1ArkXrSbSjvuU0tVyupBxrQFzs
	EL4pzb8Vxq3zc5GhDuR6GFjASWV67prCCA7tI5TzAEAjXdmzhyBdSrH3MV6yqljeUqCbD15j0Y5
	eg5m8I/lwG9F71+KOryXF3YIBYxh47Io4zS9IW9h8KxVB42fFHMg7E4On+iFBCF42C2TmxQqpg0
	TSDqVaWlOFNn0TEQI5cO6hZWgmoRtyfOcFGp5fHdxW8w==
X-Received: by 2002:a05:600c:4f8a:b0:426:6765:d6b0 with SMTP id 5b1f17b1804b1-427b88978admr1779695e9.15.1721062181923;
        Mon, 15 Jul 2024 09:49:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnoYAynnY0asrZLTrc78bfr46PGQ5GloBXrLUfddnx91KR0+z0DchqdPqbpss1XMEqY0EJVg==
X-Received: by 2002:a05:600c:4f8a:b0:426:6765:d6b0 with SMTP id 5b1f17b1804b1-427b88978admr1779505e9.15.1721062181400;
        Mon, 15 Jul 2024 09:49:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafba0esm6896891f8f.71.2024.07.15.09.49.40
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:49:41 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:49:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 2/9] makediff: cherry pick table env change
Message-ID: <c210d1bf4c64145ad3aae7155ef6050433f23346.1721062136.git.mst@redhat.com>
References: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

latexdiff can not cope with environment name changes.
cherry pick to avoid confusing it.

Message-Id: <e69cb7619afb40089440f12cd002f1af5429b090.1720972792.git.mst@redhat.com>
Fixes: 72a91e6 ("admin: Prepare table for multipage listing")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 makediff.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/makediff.sh b/makediff.sh
index f98fa33..11e518a 100755
--- a/makediff.sh
+++ b/makediff.sh
@@ -21,6 +21,7 @@ while read -r rev; do
 	git cherry-pick --keep-redundant-commits --allow-empty `git rev-list -1 --grep "^$rev" $newrev` || exit 1
 done << 'EOF'
 editorial: allow for longer device id table: makediff 1.3
+admin: Prepare table for multipage listing
 EOF
 
 #mv specvars.tex specvars-orig.tex
-- 
MST

