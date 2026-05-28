Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D271A340A46
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779952433; cv=none; b=PYsscQ4PtpPFU/rt+vDo9ElStNLPUcnB4NWdtVruLkTcbQ/9AdPlfgN2p/tdaAMIJdUXqFWdqaHwdrrxzTVOdiPmXZzJ8WOLWixH0Nw950YLwln7EcdJIgCZlm9U5NHEN/Dk/1xW6Al0Bn5B2Ykr2c9VKlac7rsb/0DpzrIIG/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779952433; c=relaxed/simple;
	bh=R/vt0BQDHGvP+q4031ilHish4U5Pc0VCbSiXl4fNQpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=d38Rsz3aU9xMbUxIswY9U/72m/4+i7m+anlr8qxsfwy4RFUwCtx4W6GFqa48IaBauiaTrYDS9yEGFYrXsVq8xonGSE6i0107LbmpKJnuh5VpRfQYSa1qdyzeG/hQ6NPui0HLiH28CAlHCxBlgzlriSoj18esxSdMLOliHwr8eOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EJ839pmg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EJ839pmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779952430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MBbdQlT9JpeL37fgnLGFmUOWFZLfY9C/zwOmNNDo/kg=;
	b=EJ839pmg8dZtHeMyGagha8UjBmrmLsCf16jzlDgCqb8ZAfx/ujrsMO6f/xDBX/HCyJJI1i
	RKbVr+ucJ51uINaHwSMYL+Rg1XzLfNtTF75j8UI2kEpo1joJ2zPH2gPSOJcW1ldfuMbwho
	jOp1r0mcnUfTT33OgGbENe2NPyDU4HY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-xUiAsX56P_usjo_cHNpybQ-1; Thu, 28 May 2026 03:13:49 -0400
X-MC-Unique: xUiAsX56P_usjo_cHNpybQ-1
X-Mimecast-MFC-AGG-ID: xUiAsX56P_usjo_cHNpybQ_1779952428
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43fe791a398so9319920f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 00:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779952428; x=1780557228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBbdQlT9JpeL37fgnLGFmUOWFZLfY9C/zwOmNNDo/kg=;
        b=NIPvfiIQjlm8Qj6BH7NEypqgQ2Pa/UQTpq1bwF7U5thURGQ27Mxn8tI4q6aXvCRFQz
         FRbwEyLnsCcYinSs/gS0UJwK1K0wugW9GReSNfy8c0OH4djsy8WqsMJL0Xbw4XiWsr7d
         tpxS8tDI5ZBNFTS0MDKzRsg7zUEm4TPCr8FDZW0xUhfDNmlXREMQuY9UwYNWSiDD+0pk
         oIlBycsCr4uz+jPo2CZNsGblJceixCPrq0EQ5lKSCZQxuJ4c7Q2Q0UO8iW2R6OvMGEPJ
         mI7SFCRpIFgC8OxJW3iSC9bGvsqXmR50sMomsyf+j7eBt8Bve+wqcAp8HSRDVg0Mev+G
         4UKA==
X-Gm-Message-State: AOJu0YxnP37WY/WlRyaSGpH1mTVM8DUy1MWw4+FKXaJgxRMNPl6jwQI3
	44wc23GEnEP3aHtRrnjis5XDYa5cjMD+G6waqBmPbqyPKNXQ064scJ+fs4NYYHPOZlrAGVkjOhb
	lpCdUZLvmDc6shW+tYlmZt+E7t6TuGysUkGbytx1cvXPMm3xAy45ceFFnslWUCloG/agu
X-Gm-Gg: Acq92OEyXWXiouNxDkJzU4G98n+q+lo3pmd/PhBJFcgBvQGZEbED2UvfMo2QLkThtDK
	N2kxVkNqMyZ2dGyTkr5i/Jq0OZ2dStOdKPFjAG0/cH9UJw5oj2kdWmqQRrueYFYRAqLU1XDFrK4
	a123C2UFLDrQO3CaAPhe5zdF5mFY1Qo9EI9pAnjQmg69FxOiWF77IVn30XtZjnXMdcd8RgOX/0+
	nq3hJIMhqEzFiFXstDM/Q0/fCHZxqmJffBUzz5HBZJ05VtLxs646/nm3GkiowIgNfe5eSZIXLMj
	vxcE1D+RRsYIQyDG+RWNbb438ws4DJxTzs+bMJ0z5esI3m8wmJ5JKfYZvmmA+YkzR3XKMSkSGIN
	1wMnqS4CBoc0eewEoWE3vREk=
X-Received: by 2002:a05:6000:400c:b0:45e:651c:47bb with SMTP id ffacd0b85a97d-45eb38af64bmr43283423f8f.28.1779952427514;
        Thu, 28 May 2026 00:13:47 -0700 (PDT)
X-Received: by 2002:a05:6000:400c:b0:45e:651c:47bb with SMTP id ffacd0b85a97d-45eb38af64bmr43283379f8f.28.1779952426962;
        Thu, 28 May 2026 00:13:46 -0700 (PDT)
Received: from redhat.com ([46.210.234.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm4836469f8f.16.2026.05.28.00.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:13:46 -0700 (PDT)
Date: Thu, 28 May 2026 03:13:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: MSI-X vector limits and reserving a virtio device ID
Message-ID: <20260528031123-mutt-send-email-mst@kernel.org>
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
 <20260528010721-mutt-send-email-mst@kernel.org>
 <ecf46c3a-1ea6-4a22-8ff6-30871636ab28@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ecf46c3a-1ea6-4a22-8ff6-30871636ab28@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1hwXmsXM6iE3_VegrD4fKOWR_4gxEtQ59-z-sjJrnBI_1779952428
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 03:05:18AM -0400, Demi Marie Obenour wrote:
> On 5/28/26 01:22, Michael S. Tsirkin wrote:
> > On Wed, May 27, 2026 at 07:53:11PM -0400, Demi Marie Obenour wrote:
> >> I'd like to reserve a virtio device ID for virtio vhost-guest,
> >> formally virtio vhost-user.  Would this be possible?
> > 
> > yes, follow the regular process for reserving IDs.
> 
> Is there a process beyond just sending a message to the mailing list?
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)

https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues

However, there seem to be some opposition to creating this device.

-- 
MST

