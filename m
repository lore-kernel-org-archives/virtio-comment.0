Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B731C68F
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 03:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716263015; cv=none; b=u0JsOGgtdrYfyY269aSlWGdbUif7uAq7UpWY1x3ZaMHbljcwPHXU7QhOxGKS4Oob/2talHJmJk59ap7fiK+akgYCzJDvSgv5LDYOf03XZfNhlzWHQe1SZQrga2lm3sHJ1YXGH6EPzAZwa3oJ1evblC/R3L0tgrCHrB8Z0mmsDvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716263015; c=relaxed/simple;
	bh=6jvQxdKmalj1PfHeE5mlry9xw6ZbqWHmqY440e0E6yY=;
	h=Mime-Version:In-Reply-To:From:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fd5gADmol2qV6bctP5CqahFThxMg+3MmQFUEgN/jcUsXgGp17ilykh8bY90zUz/9tGsi5NJgCch4FoW19TuVH3PbIf9BMHoo6OXUWWl/MEC9gI8AOGjAOMrepQffXNsEBloS67pyPGxAgHSDOdtwk+Evq4/aFdtTytn39JllWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iGyNgBqf; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iGyNgBqf"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-43e2bca05e8so20845101cf.2
        for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 20:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1716263012; x=1716867812; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:user-agent:references:from
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxQCkij7tuTRSgOmmbGOBpM9VGbfWKNdnfafG9G4dGM=;
        b=iGyNgBqfvLzBIBQYxS4qBiZefjvPDz5YxyvterlMgRqWieM3Hp/B914EOe3KAvaIVc
         Nj/AcD3zY+UzYgscqbGQBNaOl3iPmrAOEJu+CHGDk/yfQyvOA8EhX8KylbAkiWSZ7t9R
         rBHGSj2S1Yp7mPMKDMCQZZ2YYuX5TKUNpYJIPm/TOVYr9VA9T8ONXaSQz7w4uRRlTSOR
         2VRoU1vnnm9/1gsqcyhtj7pN8g5K77VLvxTHzQdR6vZco1aohS1ue1J58SKC22hEEVdG
         4Zj3BI4i66QVujUZFRku7aswzjOWNRZDLMb3I6PiSMaJgjf3fkqbyUTl4xJ/o4rKUTZ4
         t5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716263012; x=1716867812;
        h=cc:to:subject:message-id:date:user-agent:references:from
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxQCkij7tuTRSgOmmbGOBpM9VGbfWKNdnfafG9G4dGM=;
        b=Qc1BkKzJp8uch5TzW885/IfaEXIFyoK2OdHE+698X7g4qR5vzbLBif8UkoEhU3MHLV
         70sKNFOCL0+a+Gvfe/DrKeguqG2IcFi4PSOMPjLYesCSte9YxJQaG1o0m0WaeKHlhIMB
         PhoPoqT2JwmeROazV7qUKS73lc0hpY0T8xvMp6A3AW5dqGv4wiB7bBULqtE42fnB2Js+
         +jRMUCyTiKQpU1VqAxdYcXAqVGs+wEa65X54TiD2q7WXRX2er2yR1D8suqoOyI35KsHx
         4Q6F9zEj8MMHW6wnzIvo2KYcpVlMNN5omGaKxAHezq1lv8/QShlG3BktZBWQIjiKlUD8
         SWfQ==
X-Gm-Message-State: AOJu0YziWrJ+m/uRfZ4Ox6qsks6LrX//nYbNOnNeWgoKEXBVi2J78ZJP
	SoRxZTFnxEBIoDlndY0oH9briXuGrjnbMlrPdFAFzZ0ZxtT8hSzH16lWhepyHGeunf/DWKwqosM
	N4YdZu6RpwLeXWeSjdPcpQ9vzFyrXKOUNvRF8xpO29vXQB7q9
X-Google-Smtp-Source: AGHT+IEkk6XWmDDr5eaKQyN4fHVQIIlKiP+6cN5W7Czb/x6ehLTNmxvOsp172ThPr+T8O0FgkvsSq8jnf6/7MpI06kI=
X-Received: by 2002:ac8:5743:0:b0:43a:d39a:45bc with SMTP id
 d75a77b69052e-43dfdb918c4mr344660301cf.49.1716263011883; Mon, 20 May 2024
 20:43:31 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 20 May 2024 23:43:31 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
In-Reply-To: <20240513121005.459013-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
References: <20240513121005.459013-1-pizhenwei@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: zhenwei pi <pizhenwei@bytedance.com>
Date: Mon, 20 May 2024 23:43:31 -0400
Message-ID: <CABoGonJ9qz3zGfW=c77RM9k7tWBYt1Tqy6mHfWnaihzudH1oSQ@mail.gmail.com>
Subject: PING: [PATCH 0/1] balloon: introduce 6 memory statistics
To: virtio-comment@lists.linux.dev
Cc: david@redhat.com, mst@redhat.com
Content-Type: multipart/alternative; boundary="0000000000002a3daa0618ee9f2e"

--0000000000002a3daa0618ee9f2e
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch seems to be ignored over 1 week...


On 5/13/24 20:10, zhenwei pi wrote:
> Hi,
>
> There is a previous discussion about the new memory statistics:
>
https://lore.kernel.org/linux-kernel/20240423034109.1552866-1-pizhenwei@bytedance.com/T/
>
> This may be helpful to describe the usage of these counters.
>
> zhenwei pi (1):
> balloon: introduce 6 memory statistics
>
> device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
> 1 file changed, 24 insertions(+)
>

-- 
zhenwei pi

--0000000000002a3daa0618ee9f2e
Content-Type: text/html; charset="UTF-8"

<p>Hi,
<br>
<br>This patch seems to be ignored over 1 week...
<br>
<br>
<br>On 5/13/24 20:10, zhenwei pi wrote:
<br>&gt; Hi,
<br>&gt; 
<br>&gt; There is a previous discussion about the new memory statistics:
<br>&gt; <a href="https://lore.kernel.org/linux-kernel/20240423034109.1552866-1-pizhenwei@bytedance.com/T/">https://lore.kernel.org/linux-kernel/20240423034109.1552866-1-pizhenwei@bytedance.com/T/</a>
<br>&gt; 
<br>&gt; This may be helpful to describe the usage of these counters.
<br>&gt; 
<br>&gt; zhenwei pi (1):
<br>&gt;   balloon: introduce 6 memory statistics
<br>&gt; 
<br>&gt;  device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
<br>&gt;  1 file changed, 24 insertions(+)
<br>&gt; 
<br>
<br>-- 
<br>zhenwei pi</p>

--0000000000002a3daa0618ee9f2e--
