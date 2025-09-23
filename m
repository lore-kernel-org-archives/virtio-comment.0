Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA70B265CAD
	for <virtio-comment@lists.linux.dev>; Tue, 23 Sep 2025 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758614948; cv=none; b=OJiyyZajCKCZALmRwNQBs9VlTXe5cw2YNOCWxKEBLaHpqghRZa5IQmmy7cYugc3Y6oeNKXq4mdKyQkhyB3hQ5jz4sy4HeUg/H8S543f7zY7FE8oF6XvUhRp7AuMspukZ1GCgFT6UxIDtbSx3mORn/cKhTkVQ07O2gLIPmbGQKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758614948; c=relaxed/simple;
	bh=aRxi/I2nA8tP72g0lrgHyftHlHtcJIm224acV6KsAw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Pg1zysagO7Kyq342GhAJmDOE21+Ir5fuCDGr6EdQgtlBlra3xnPECuqqgs4wH7kA4o52HHnRwXD0Gt+7PT5p9mn9HrmbUasBftKSsHNAPWysn9NBgEssWPR8DaEOCyaZAYvIYYADTkW9h3ELHlkWJK34N6LF90AYKFkj7EYAZgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bosCxqxD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bosCxqxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758614945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uBgengON4iCDl/ixg/t6bDHmID39X/O49YcNxUAQEGE=;
	b=bosCxqxDLAn4nB5PnwXE3gQEa88IxzLuGBeoakhzai8+RH+g2J53wJjV29i8nk4G+P18aX
	hv2LuIZlDXHB1RDBI5TxXyl3yvKLiI0oZ+zf31gc7uv3zCSpeKg/yafME+iXXaEtF2GG6c
	bs4Fda4efCS18OrS57CpRH54rxyBCPE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-JkBOL3APMeaj7uHheJuMlA-1; Tue, 23 Sep 2025 04:09:04 -0400
X-MC-Unique: JkBOL3APMeaj7uHheJuMlA-1
X-Mimecast-MFC-AGG-ID: JkBOL3APMeaj7uHheJuMlA_1758614943
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46cde0b2226so9661865e9.2
        for <virtio-comment@lists.linux.dev>; Tue, 23 Sep 2025 01:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758614943; x=1759219743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBgengON4iCDl/ixg/t6bDHmID39X/O49YcNxUAQEGE=;
        b=rgsUHujphhH5sGMvb6ulrcsDsX78ivGwl+Nbek+uZPoJj5EcMMcFSm/bXcq5MXxZ8o
         Wo3KwsO2ZPqXeti0GWmH9VLLpz96Tu4Y2FXoAvVVNEGhJ/cMGmYMHaWQLW4sZx9rwyjL
         5RJYXpn5okX6YawhTxa8eXT4/gdsnuwMLL+J3SssN55mFK5x3vV+0fwSjWO1q0ixRQDb
         MEsD8Fv6n9TRhMK+x+1QrdKhCG5pW+xuTuWWB3O8aBf+fv0tsREZ0LCGzPHX41Xrt/w4
         XZfRV9AFD+aWbIFoUU81r560WlugUy4O1wIZu9imWPSkLe/C7tuLT0E/402H5SGsgVdW
         NIQA==
X-Gm-Message-State: AOJu0Yx9sRY8QLPWO889DxlQTeRm/UvLzaaJiQ1CcaFZ7SrlqkgbYU4k
	Dmrax9fPuSGBkAypvy3SY5RlPjwlsJtQZ/kK5r9pi2Rqf3sxb4ZrH/ko6cn5F2+E0+yEO7Subpg
	pJHjyR22EhFYvK+1sHs5q+klTBn8czGgjRu4622/nnwwA4bobS5dhuFeP5k/5Pdu7x3CJ2poUYQ
	yJsFCa+x2IVXr1IHtcqhqYU58yDpa76p9B+LXO91QvwNHP9gHeEkEP
X-Gm-Gg: ASbGncthDSsGFcmjYy6vkAeezdn4x/A6zZuH5MPXYGRAM/TzjOkxxUNSFM+62qO24no
	i+pk5cRzvKHJPz1iTfe17ejF3j3ncNt82Kl8jmm5iXtzMfA5aeIQ8JBVLVgf4DrcaLTeqCNYjTd
	qQfz1Qmw2Q3XR7sEV3L2ZtLuUWHOhwib6XSNnZ8SoAr0vT4bZU+4VqEOynfEtPFZvJz9Oq0AywJ
	gWwIk9hnoS41zV2WTAL2RN0gM9wq/oYCn6nW+AOgJ1wPHCu447GiKOcfGFfc8veT8CL9S+3lRbM
	S+sLVVtctXW7afAzowDPLRDJrMVQxCMSug==
X-Received: by 2002:a05:600c:198f:b0:468:9e79:bee0 with SMTP id 5b1f17b1804b1-46e1d90cda6mr13376675e9.0.1758614942749;
        Tue, 23 Sep 2025 01:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJIDYN3PifV/W7q4XMXBu1iVA1h0FSOdxbtuiPxtRrAY3Fd3RliD8qYltVVZPZ2pWwtRBuVg==
X-Received: by 2002:a05:600c:198f:b0:468:9e79:bee0 with SMTP id 5b1f17b1804b1-46e1d90cda6mr13376315e9.0.1758614942171;
        Tue, 23 Sep 2025 01:09:02 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46dd4e52b36sm55863045e9.14.2025.09.23.01.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:09:01 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:09:00 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: aesteve@redhat.com, sgarzare@redhat.com, parav@nvidia.com
Subject: Re: [PATCH v3] git-publish: add profile
Message-ID: <aNJVnNVKHbH9Z8zB@fedora>
References: <20250305164546.1484029-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250305164546.1484029-1-mvaralar@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jaWHo2RKLWlb3bo9ellVthQsxuHtB1V4FoSjKPFge40_1758614943
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara Larsen wrote:
> Add git-publish profile and document how to use it.
> 
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> v2 -> v3:
>    * remove uppercase and the line split and use italic 
> v1 -> v2:
>    * add link to git-publish
>    * document that the project contains a profile already
> ---
>  .gitpublish |  3 +++
>  README.md   | 15 +++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 .gitpublish
> 

Hello @Parav, I can't remember if this have been merged already. Since
this is a non-editorial change, I do not think require opening a ballot.

Matias

> diff --git a/.gitpublish b/.gitpublish
> new file mode 100644
> index 0000000..d412896
> --- /dev/null
> +++ b/.gitpublish
> @@ -0,0 +1,3 @@
> +[gitpublishprofile "default"]
> +base = master
> +to = virtio-comment@lists.linux.dev
> diff --git a/README.md b/README.md
> index c06caf6..b521978 100644
> --- a/README.md
> +++ b/README.md
> @@ -110,6 +110,21 @@ git format-patch -o proposal1/ HEAD~1..<br>
>  git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
>  </code>
>  
> +<dl>Optionally, you can use <a
> +href="https://github.com/stefanha/git-publish">git-publish</a> to submit a
> +patch. This project already contains a <em>git-publish</em> profile that will
> +configure some fields, e.g., <em>To</em> field with the right address. After you have
> +installed <em>git-publish</em>, the procedure is the following:
> +
> +<code>
> +<p>
> +git checkout master -b my-feature<br>
> +# work on new commits, add your 'Signed-off-by' lines to each<br>
> +git publish<br>
> +# more work, rebase on master, ...<br>
> +git publish # will send a v2<br>
> +</code>
> +</dl>
>  <dl>
>  <dt>When to use the virtio-comment mailing list:</dt>
>  <dd>
> -- 
> 2.42.0
> 

