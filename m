Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906B24AE12B
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865080; cv=none; b=f+izfd0jDacbfWD2hWTZnyGoYAmTdWcQjgHG4r2TmOiRNx8kvDE00yJ5DrOo38m/FBjgnl2V3qkCykAi5iWJ/+zQhtqvV7wFXzkZx7ZFWRXeC34fXUL/B3cd7DFMheC8SaLn+0xFo2FyVfTG/u3dFr8grXJTJBk9QcS7LERaIio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865080; c=relaxed/simple;
	bh=sv+818dGnM8viBNUBfx1n6sTrYgsjglRPrGgHtTnFl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FrQh/ZPBtpT9MKXaBFI925aID5htt6hHLGYGUCf8aCSrqaCpIFjqJSMw9bF9XP6mpfTtqnE9GjsBL0xF9g7nuAQqXJ2jTZ5Xd34be+gQ0ZmZN0u+u0IFmHuugjb769Zo7tNGtgyMzCU8Em+LpqpYps9ckund5G9xrauDNozzxMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dS67u/td; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dS67u/td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788865072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mg0565dJ5oA3oY5Jb2Xeqb9MBfVuB4Vl3dSkbyvzEq8=;
	b=dS67u/tdGNdEHTWcUHGQGglYlHUCNEWGh4O9v7e34QtTXFY5IngA9wGexFEC3v98LR7tNi
	MLacFQzqsW7LFU2OVH0LzQMVdA+tPHg5eKXxn0DHya4kOcpW9U7TEPR9AUOOfpsx4DvU0k
	1b+B1FvOVPms7x+NZAtMOXpjHeMnFPM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-jo1ppmGFMhqWqp5O-YZEIA-1; Tue, 08 Sep 2026 06:57:51 -0400
X-MC-Unique: jo1ppmGFMhqWqp5O-YZEIA-1
X-Mimecast-MFC-AGG-ID: jo1ppmGFMhqWqp5O-YZEIA_1788865070
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c253185765dso477114166b.0
        for <virtio-comment@lists.linux.dev>; Tue, 08 Sep 2026 03:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865070; x=1789469870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mg0565dJ5oA3oY5Jb2Xeqb9MBfVuB4Vl3dSkbyvzEq8=;
        b=LNKD8I4KdWiCMgl/WpQuMpkyBXVrsayunvhZo24lmhR8H0g3xGD9TWXp3zBp8w6+eb
         L8bYW4gHieIRFcxWUPr+bNK5/LZoR6zrnecbB+wND9G4o4hWzgXD1qgTaKnD6MVs4ndZ
         6RFiB/duWwMfUhc7Zres44O0b8xKTB4xtlB96pHlqGW0TxTXJ61quv5OH2Pd92Z9SHY4
         Qu1ajbByIDHx+pmgCOpS5hl0pYLjT1ZfyZjLVhmQ4VPVP/onITilE1FXpC6y9/BqDGyc
         3f2VsmYIctCReQBltguAzzgpk6tlvLGTGwrHeFlR3fPd7NXvX/6/sNWO8acIWI8l4Zcj
         SZ2Q==
X-Gm-Message-State: AFuF++kO1jcK4y6M6KRmNqNiwbRnREpIHSRJ+aPOV1ed3WkA/BUvFx2C
	kQygmQS6VpFe1G3Wv3MISd/MEj/vZ9XpD9oqTqZ1UBZVwRl3uniki6XyBtEV6lkvYfw+4sOddbr
	rBGjgr7LlV4jl6fwFFDB2uSXw2gM+MXj1IqO4TU6KGttiMlOZ817tu5odaFv0MOX7bsDLLcC7pw
	Ei
X-Gm-Gg: AYBFou19GqOO79xAHpddUq3jDZqmAqFmLKHnU1tCUJXBPeOv/uncqTHAFJMrSuRVrw0
	HLsDlcF1n9jiwlZ2cuaovktpWO/Hik0ETdQ7WTxRIOZujt1EZmdTIs29SHbHEQ0yuwGL37fRDXx
	LX/MdLXdKwNC3U1haACpT6w+hDlP0Nbi15dvkf9ezC3z3BcJjiM50w9Mo1qH3u3ZHXZONyvuynI
	RyhitaG3onqkNzG3xtZb6rTnN0TKnztJVOYgECfAtWwZRxxooJ6w0657rkWFPgbHrR/72CbelAv
	q6wgwpUQK6Jo8uZ316Nn40YWU3+xCVB/NJZazt1uJId/yo6SZgf7vxFk+GlA4WilZiKZ8AnqAaT
	YmJHZRUAvofSdCbAnZLU3nfg=
X-Received: by 2002:a17:907:e153:b0:c26:2eee:ffc7 with SMTP id a640c23a62f3a-c262eef1017mr481607366b.35.1788865069707;
        Tue, 08 Sep 2026 03:57:49 -0700 (PDT)
X-Received: by 2002:a17:907:e153:b0:c26:2eee:ffc7 with SMTP id a640c23a62f3a-c262eef1017mr481606166b.35.1788865069215;
        Tue, 08 Sep 2026 03:57:49 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c28e4579395sm335567166b.48.2026.09.08.03.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:57:48 -0700 (PDT)
Date: Tue, 8 Sep 2026 06:57:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908065725-mutt-send-email-mst@kernel.org>
References: <20260906145444.127570-1-rjones@redhat.com>
 <20260906145444.127570-2-rjones@redhat.com>
 <20260907033334-mutt-send-email-mst@kernel.org>
 <20260907140224.GQ1436@redhat.com>
 <20260907123437-mutt-send-email-mst@kernel.org>
 <20260908093534.GT1436@redhat.com>
 <20260908053922-mutt-send-email-mst@kernel.org>
 <20260908104345.GU1436@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908104345.GU1436@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wPJ48Iv_y5JCLOaJ_kI09r1SlqEcymIC8nz59em8k10_1788865070
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 11:43:45AM +0100, Richard W.M. Jones wrote:
> Anyway 20 chars is < 36 chars so the need for longer serials for
> virtio-blk remains.
> 
> Rich.

I am surely not arguing about that.

-- 
MST

