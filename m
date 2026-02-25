Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C358B34EF05
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034124; cv=fail; b=QLBoZdenf9/62JzG2eB4Foi+U8bvUuXRPk0brS0RKadNIqhe4cLm7Cf/rdUlhWIqTOdQPTQeyTUTPlvUX1tstaE7Z97R8vyQq5TmcDt1h+r2m6zfYU5RS4NnBfcuO2Mr2uSQ96fsP9APrD3AGLUq2XvUCHBPAlW92tF/EukOgf8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034124; c=relaxed/simple;
	bh=SZMthv7zetuwGuwUueU5FlpCSyD4ZgwyEMuHydDQ9XY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rbc+gq6RWbZy1I5sgwBolrIWclXVZOXKYrRPBdE+R53toGRUk13/B99v1Og1slkPVIOJzlcCmzMsyeEKTVshKZBw0XKXuarLY+x6zMJCuIUwnFFy3iLgGWymKw0QwhyVXXkRGSozsRSTI57DLuvuyooWPPMFAUEKB8A+ptDzNo8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ot5lZyo+; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ot5lZyo+; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ot5lZyo+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ot5lZyo+"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=huN8aelUcR0rW9ii7f0ukm7iBljdSgqzL6XURr8I1rQaZVGWAYt/3qK5XZK6Q1cdTdZAW+jdoxE3Wqv5I1PBUXL5+lMAvbuwYvUvTKcD89pqoVlHyUyxhaXjS270XBkPlFhYNzwtUrizFPQZpnZ2fansNDx0OacQtpfowWI/ModcUEafbnEy46MxIQ4cWpyEWaNI4kY54pdpZU9xEgjqQASrOy0F2yzfFOaxi5SIT5SiwO+q1LoJMUh9K6iMDazflZP/UXQ99/fUyjvjevsFYhhM7eERQ5ITAY1HLeCu/p//RqrNxSDm0GhnQi+5cPKjBDfrHgkJuHfj47mi0MRcoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMlMDEPbXKY+yitlJl+RsACIDgwCKVdbGWf8+f0/6fk=;
 b=A38xvjGdQLkYlBvIr8Ohl/nbIskkEew1LwhsjWZMvzIg6dC7+ekuyE1nXxdzIAG//SLHPH/KoL3qfQUGmvhBXk86BF7kT3bXar0lmpYSmDOd6Pne2iecb6w3mPJKwHKRZ9w8B+nPPfMAaoqlBjvaB1stN1W9h/8Xpu/x3mtDk/nJ6dB0cjJv1ym/lxsjMLD/iHvjufwhe5OdS6lBlgOPsdhcwtz3kAAWoAbwL76bZz4OodB3tMT6arq07trtkFuZdRXSD/q7R7ZSYNwiFZ7ZaWVZtBctWXWYAX6yMqXdzoAPzfa+6grnuPLqBuB1kRm0gA0Pelb9QXNPKmK906/hcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMlMDEPbXKY+yitlJl+RsACIDgwCKVdbGWf8+f0/6fk=;
 b=ot5lZyo+1hkA2Qq9IfX5leRfU4L9cl+jG0ZoZunJh7TSHvq6LkWRzKFT5RVtzPEedgLmR9IZdY4G4sg8sAJfr4Sj1INWNX5X9jTKpdp77/wXDJLr1d3I8XyzFW1KGn7UVWR5Sr8pj9B7gaUsutLWTbKfnrgKE/UnAQVi7TldfDE=
Received: from AS4P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::18)
 by VI0PR08MB10846.eurprd08.prod.outlook.com (2603:10a6:800:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 15:41:51 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::39) by AS4P190CA0014.outlook.office365.com
 (2603:10a6:20b:5de::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 15:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 15:41:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tal+giKQ0dlsFfPjUQXGy9oD8Rj47UBtmDl/9YwxRfvETwmdwPKBzy9w4lTGc+2Iie35Q/9bFkCwmm4befrnzhwDeg//qIc/03ReM0bAInUDXRVqlQnDI78ZYA6D2rzf4Me0TSsccfxmjX0qsE3vE58engHNHclpdWMoup/lVSgxpvsuYMAC/4R4OaAng0c8Dde9vpz94Jez4EgRUNXnPR3sXZlxqWAn8gm3OCtVLVDrwjceXeRC2722ED92alcNadAKBrP79mbTCRXh+4CHFM2u1WnpWMSa+50sYWoFhBc8knTN1C4D/6uzTIGpc/88HRP1ccL+0XrqDKmQKt5NeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMlMDEPbXKY+yitlJl+RsACIDgwCKVdbGWf8+f0/6fk=;
 b=IW5ozmxjqBe+DrLLLQbjoSZrwlnxJROewjtdCXsQfCUyzcKsxeJyR+VjTCLqnz0HSavVbHltm4ey9Z5peTYE42WvJbK2i9MmFnK0I83kdLvYbZNRUZOo8pMb9yS02UU2Sq0G1o7xcYigqeWxRNEjdIKKfnixR5oJhZ24lWAAYLbqiZBYafRUXB7Uv702wP6n/Hbsysd9KuwjISpyjEUYDOX0zs8xfhUebR+3DuZtsso8BSGIXUEog+SErgmCR5cOAzXSgkYi3YW+jV5/5Y0Jx5L9cHCxWIwao4DBF4iU2UfWsgT5mNvPydZLP3ybf3YpJ7WqbXhliNldYoZ1Njl6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMlMDEPbXKY+yitlJl+RsACIDgwCKVdbGWf8+f0/6fk=;
 b=ot5lZyo+1hkA2Qq9IfX5leRfU4L9cl+jG0ZoZunJh7TSHvq6LkWRzKFT5RVtzPEedgLmR9IZdY4G4sg8sAJfr4Sj1INWNX5X9jTKpdp77/wXDJLr1d3I8XyzFW1KGn7UVWR5Sr8pj9B7gaUsutLWTbKfnrgKE/UnAQVi7TldfDE=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB8249.eurprd08.prod.outlook.com (2603:10a6:20b:53f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 15:40:47 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 15:40:46 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Manivannan Sadhasivam <mani@kernel.org>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAAUZgIAAIl0AgAAFBQCAAAMOAIAARd+AgAABNQCAAAEXAIAAAdKAgAACEACAAAE1gIAABuSAgAABF4A=
Date: Wed, 25 Feb 2026 15:40:46 +0000
Message-ID: <238DE205-5A87-484A-A68A-F3312B22AD6D@arm.com>
References:
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <SJ0PR12MB68068FA1D1893B774C5A8A15DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225094902-mutt-send-email-mst@kernel.org>
 <8B4F5FE2-1F80-43BE-A60B-5C24B69C8B4E@arm.com>
 <SJ0PR12MB680642C4277CBAC888052FDEDC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <SJ0PR12MB6806151DD9BF3AEF3839FB62DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <E24A071C-02D3-4465-99A9-732FB4EF49B7@arm.com>
 <89d13644-04ac-4057-b197-a6efe5e82ef6@gmail.com>
In-Reply-To: <89d13644-04ac-4057-b197-a6efe5e82ef6@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB8249:EE_|AMS0EPF000001B4:EE_|VI0PR08MB10846:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e27e4b-0367-4363-8c3b-08de748464ea
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 UAT5Cu5XKR4kBBNLhX3wYwIAs4R04qD0h5wmVXYS35zVylU3sDrZeH3lZFDdXvCufU1rhVUTYm3eKjnB+vbJP/H+R8phaKSN35F5GP1DcEE8FUmwA5e8ihFHIKEHhGx0jr1fgWD4jIn4LTguRpcFDU6tuc7eRYgG8zWqKO8zc/dnjyDPx8d8405dA9l6ZX1azOM0xM9K/gsvHl/Okt1EgneO+yXCkVDDcHH+w4zvTr+TJQwirTH/3EG7ofDH9lujz4UKHVNfSx/BvP9T6pTe6spUJ17FbFCLoOq6GRy8cf1oTGjIUSGKo7+d+Q77oKwmSp+Wu2H8XAnVK3eGYK9+c8U0KuIPE2tTrywaOo24tyLqG/y6FDXViFk3gdA8qrGHmuSV8BhZ64bU5feIoqrIg3gouVnqe8rXl8muxtY0dl5PRDEVJuYUI8tPpQJTOhZenunrjVPBh8ZuE6Tl0wlOPmxG/LGgThLZ5wE8HKcKWmoLBNGTD+bvqc+9hlTohfJeB8jLzpj4nllOclUjRN8e0gUJucxsVvszN0aa0IZrNiqZvosCeEW9+V2NNKJ2kGdgn8V2NTTKOjdRBWHZB84U92kxjy2+Yw1qDR6iQ4lb61/IfQl8ivOx1GhrE5FuzGmPj+WTkG+a8Wcr5EPwqR0ZqM42k+EkJUqSBCHyJF279bHJHuZMv+/M+1RlJGYdp/wAJnGscuwdiDPOl/ep9hI+WEOFRYObTkQ/vm71EkzsvTuWHzY/ZjGIuXkZtmgIGG7Mq9e6s+Bf7AZ9szjvapCJGyFNwjwlhKKN94Pu616cqio=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B8D2F1F95AABAE4F8D34B9F724AFB8BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8249
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf99648a-a398-4a55-757c-08de74843e46
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	4y/R0JcjWfJzxa5eLDA8iT/UkHBIL+6ycr8cNiL/Oom+XvmHDdof/uhRHeX0t39co5lJ4NG+J3sMs+VfVjj9wZ7TFyCuknT9QddvTZZISzZylJZCq+unn2YJinTWDF9TW9MlN7PIArxso6GuCVz1VTBtX2Qy4CNwIzHsWon9pfx8V7NoYTKe+LVaYx+zFeV2nWOFoKZ7JqXwWXkBqMAAYMxQpsSvQbxaQ7/aFm2Xqx2o49VLpU9CF0bzFhuhJOprlemz5x/KavGddzp7so0MpX2NSRXCjKId09H3LLVLkErbQN8bV/V01vkGlidWG+zklTWB1hyiEGJs3y3nLHBjJvBscgSZKK2GugSKphWNC5FXU0umK/zDKqs93b/SjXVmd4hZyp/+RDfKpQY67HAnUnh4Cww3/UZ3pOdNjkdgcHsghQXwqMkCwrkavEBlz42GCyb7d26q8iS9cUXYGgvvaamaKNvcuzCqjWd9I1/WRvDh6i6G7qBU55185WpvTwb0i/WfDhuYvmcbRO3iRhLmdP+SOdc6WqBnXk75M8By3gHy4dHZHbXi7Kv7N4FRFY6gql3r60aWM7VdrZzR7j7UQiur5BdC/riHyb3yFjxGL980B0jLYoVr9N7KEvlehamuputjz9hBp++LGmG647Gq3WsuMyEAYsIPa1zzw0sfiNb4KxZ/zCNoA+mrTQWFf19Lx8puh+FWMYKF/3rgHYOSb/ID46gn6PS/kOEcb3nLV55BUXoh97sBNwissS2f1QKutKy44K9/X4DLtAEpVrWD5lea4oVDe5Tv2/CbuO7X0oZTf5vPMyT+oyYZDnmB/a9Paqu6QGMF/zC2H31739X2FQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U0J90lqz9RtYtuRNWo8uvN9BS/sq3d853nXXvZfPvJNohBDHAcj9In0F2i96uapptoJJck0Y+GdzH2NHlM+NMpwuOmfHSGMkDh4FpXig/bk3N3uaaMO/VOVqDXoKn0mlTWsh2aHFmSl1gaxbJXG4SB+6++NZcP1BaZn342ZhliioruPi638ggLoAI1eN+dSWREuKGgii5IddABuXsNJYIKvlbDS8eaY1ZbA+vLipVW/Rf3btjy6h2TG0yUh8fhhgum09FeVCccpj9qlE+KHjuhMtNvXfouXazx/YpaJnrR9+3vHdqLeNWRam2pJxEsjrMDWfXzcKVLpMkcNUYBjmIi4v75vsrsJncHe4ERkgJd0nOjH9DSvzs52/siEWST2GDvR/YlgVCJ/pe4U5l6TRwYUeQ1uNwMp8HCUDO78Z816jAVzuZy4pV9rcaRmvUabq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 15:41:50.9806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e27e4b-0367-4363-8c3b-08de748464ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10846



> On 25 Feb 2026, at 16:36, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 2/25/26 10:12, Bertrand Marquis wrote:
>> Hi Parav,
>>
>>> On 25 Feb 2026, at 16:07, Parav Pandit <parav@nvidia.com> wrote:
>>>
>>> Hi Bertrand,
>>>
>>>> From: Parav Pandit <parav@nvidia.com>
>>>> Sent: 25 February 2026 08:30 PM
>>>
>>> [..]
>>>>>>>> So the PCI device is not one virtio device but one bus behind whic=
h there can be many devices.
>>>>>>>>
>>>>>>>> Is this making the concept a bit clearer ?
>>>>>>>>
>>>>>>> Yes. This makes a lot of sense now.
>>>>>>>
>>>>>>> This is a virtio-msg-transport device that needs its own device id =
in the table.
>>>>>>> And its binding to the PCI transport.
>>>>>>
>>>>>> ok. how about an rfc of that idea on the list?
>>>>>
>>>>>
>>>>> I will let Edgar answer on this.
>>>>>
>>>> Sure.
>>>> Also please explain how is this different than SR-IOV devices?
>>>> On a PCI device there are some child devices exposed using some virtio=
-msg bus transport.
>>>> And all of them are going to share same PCI BDF.
>>>> These individual devices cannot be mapped to different VMs (secure or =
regular) in a performant way either.
>>>> So what would this virtio-msg-transport device achieve?
>>>>
>>>> If there was no PCI bus when implementing the virtio-msg transport, it=
 would make sense to avoid trap-emulate story.
>>>> But underlying transport being PCI, its back to square one for the ori=
ginally described motivation.
>>>
>>> If the objective of the virtio-msg layer is to really support FF-A or s=
imilar other non-PCI transports, lets please focus the discussion on such u=
se case and binding of that specific non-PCI bus. (like the link you pointe=
d on arm site).
>>>
>>> This would help this series to progress faster without getting distract=
ed on PCI side.
>>
>> Agree the example of virtio-msg over PCI made the discussion divert a bi=
t.
>>
>> Maybe focusing on use cases like:
>> - FF-A
>> - messaging unit + shared memory
>> - hypervisor based events + shared memory
>
> Is "hypervisor based events + shared memory" only really intended for
> Xen and other true type-1 hypervisors?  Should KVM and other type-2
> hypervisors use a different approach, like virtio-vhost-user?

Well there is definitely a use case in xen but any other type 1 or type 2
hypervisor could benefit from using virtio-msg and have asynchronous
handling instead of a trap and emulate based implementation.

Cheers
Bertrand

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)<OpenPGP_0xB288B55FFF9C22C1.asc>


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
