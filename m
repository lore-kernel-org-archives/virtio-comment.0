Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0D648AE0E
	for <virtio-comment@lists.linux.dev>; Tue,  5 May 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995689; cv=none; b=uXYee0dNIK6RT+EtHrW/ExBPir9dk4je8L+fWNEuu0RqAafp3Vf3MtYH4u8IEcfvowuxeJGDvN+1Z0ecZ06QQyO6nbbEoGfnAILZ+Spf4G+Lcdep5TLK7PeVMj6iEu8T5r2cZFI8yxl+Enc687Y/vDHZquGBxR8bXV0pgLudaoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995689; c=relaxed/simple;
	bh=OcDJZIw3rqzg6ku/5P6Zvm1I926u55LB1MDYr8JLOuA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cf8JHcZRD0fr0afDACBhSMYFaHQ0KTc4LELDOGCitEqm0dicVYJakVkIOJIghiQiwa4L148x0XsRoEZVEIMkwa7p+AOoAVyPbFv4CqPikf7iUQ2ULv4KOyZyzbdNAfxRWj890GbSzJrXtxM3kjydgHvXvH6pZEYhw13nWeTmTrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XC0btjzS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XC0btjzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777995686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=G8wlTUrWud5hZ82YmcaOn+mobIRJgAAImMd0L6QK4lU=;
	b=XC0btjzSAqy0R2wN+t4xBW0P2yEXgnx1vJWjUt68lP0FqLi1tzOyxSllnh5nLiRPqTRjTS
	6KOoxuGNkQwIJBk6JCt6LHFfHkONTnGc92dXGr8/XtJ3Mg9OqpMOH+Iwcz5qAKqQVLx0aY
	ThQbq/mFam6kT6xMZyJEYN4K73dxhgs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-LSc0lRk8PXWifn5urFsSCQ-1; Tue, 05 May 2026 11:41:25 -0400
X-MC-Unique: LSc0lRk8PXWifn5urFsSCQ-1
X-Mimecast-MFC-AGG-ID: LSc0lRk8PXWifn5urFsSCQ_1777995684
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4836abfc742so48157785e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 05 May 2026 08:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995684; x=1778600484;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8wlTUrWud5hZ82YmcaOn+mobIRJgAAImMd0L6QK4lU=;
        b=j+qX3j8eENwL3qULYmggUXXO7CFYR0bKnKRhIP6c0p5zaCwpTOak/kJGT6aX8ggb1D
         xk6gPmkTiGdXOUBZwCyBU7IW5TnyqKJoDmo7Ll24L8ZV/lSk7QkfQwG2+iUV7Y1xahP7
         o1cdwgG5srpE1KNUZ07gWN923WuP9iwbiTsEGsX851FWBkabI4b3FV4V9+OATuPMrXKw
         9Xrcy67mVk+duAVZRxa7oXj1uoXgVII4msYSQOsSEfKe5jcdAy65BOOpwSEeGafJB6X3
         jy4Of4jKHObiwnCsqgV+fhK/WSukuqGTEw6TjJHEr4VbzFNfjQLjEA8onpbBr4wORGbJ
         Hwhw==
X-Forwarded-Encrypted: i=1; AFNElJ8RUVO00QdGdqA3HCJmKvppz7Zujvn94xg2DrYDVgl26191Im/nl6zbyKNHtMFPLQsS8E1GfAX1mXxvgNoOzw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp8lhrd/mBiVtNuYmB+CUpcKbV2f/yeeV/mwvMO3W4Ggo3K0kS
	MQ6kRAMdyFqvxHkBpZXOMxXclFrSmDLAU6sd0/iKg3QZ43zFS/XrgnPGX2roQ0IEgO4Gd90ys96
	QTdMfLvzOpoGEHuJ+/y+Z5SrNcTp5pqY/enowjCcpkw9mJiwoYpNRm8dz467Ez9CCkRX9iF4m0D
	gc
X-Gm-Gg: AeBDies5yRwh437EmP0IloFJm1J0ncemd7fNYJdZbKlWSJ8co6vnLyWcRCEoyOc/Gjs
	UVaE1HEKizpCWUb1Q/ig/bHmpIZdxHoTT/WwihiWUTcW2WFG+T00ZFAU2F9J798/iKt1GMchLzo
	0DaYmuqHRIszyu3Was8kk84k9hRwdW5xwhDw8YBtY/8rY6AdP8SOMWgGwJEjkjvUbCZdVKASejM
	/BzaznX0Jw8KTPjnPfOr5gWm0j5zFgKMt6nZcFycLyMFYD6aa+iWI0qOSLG3kNoR7YsKnJ5dxNw
	GCrZa0vbwCwvhlviH/pcRspNnYQ90UI7oNlkGMwzMSTYk5YkPCkAx3HllB9mFnyMTXA97gkroyt
	KH+SAQVPhbHJPfVJ0AGfw03KFvydprI0eEG4ouBH0eQ/A3GLtfKHqiYQ6
X-Received: by 2002:a05:600c:a309:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48d187d869emr48317535e9.7.1777995683899;
        Tue, 05 May 2026 08:41:23 -0700 (PDT)
X-Received: by 2002:a05:600c:a309:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48d187d869emr48316985e9.7.1777995683271;
        Tue, 05 May 2026 08:41:23 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-47-179.inter.net.il. [80.230.47.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm642932375e9.9.2026.05.05.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:41:22 -0700 (PDT)
Date: Tue, 5 May 2026 11:41:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: alexanderduyck@fb.com, virtio-comment@lists.linux.dev
Subject: virtio balloon poison feature
Message-ID: <20260505102918-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kJ3WvRglc1susNhky4EI0qiLTYi85e13zFpC04EeEf4_1777995684
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander, all.
I am looking at this old commit and I am confused:


commit 4749f03e72f8ff6e66f54e38e41a560014e1a0e3
Author: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Date:   Tue Aug 25 07:45:10 2020 -0700

    content: Document balloon feature page poison
    
    Page poison provides a way for the guest to notify the host that it is
    initializing or poisoning freed pages with some specific poison value. As a
    result of this we can infer a couple traits about the guest:
    
    1. Free pages will contain a specific pattern within the guest.
    2. Modifying free pages from this value may cause an error in the guest.
    3. Pages will be immediately written to by the driver when deflated.
    
    There are currently no existing features that make use of this data. In the
    upcoming feature free page reporting we will need to make use of this to
    identify if we can evict pages from the guest without causing data
    corruption.
    
    Add documentation for the page poison feature describing the basic
    functionality and requirements.
    
    Fixes: https://github.com/oasis-tcs/virtio-spec/issues/84
    Reviewed-by: Cornelia Huck <cohuck@redhat.com>
    Reviewed-by: David Hildenbrand <david@redhat.com>
    Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
    Signed-off-by: Cornelia Huck <cohuck@redhat.com>



here is what I do not understand: why does driver tell device that
it will poison the pages after deflate? device does not access them
anymore so why does it care? should this have been *before inflate*,
actually?

how was this envisioned to be used?


Thanks,
-- 
MST

