Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011052.outbound.protection.outlook.com [40.107.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A72393DE3
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.52
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772033329; cv=fail; b=dOPeA40L/JbMGcf7JByM+n7vgVRFWtDbDNn3z6J7gD02vQpJKSC0DhWI12kdqePEzmJim+HPmq9KhRipeYPUJMDiJ/M9vDMwH62hd1gCuRfVlUoygylQbkxq71QolqKkOmHKznMc2eNJlUEA3+cU3gbuuXeLJrlEksFL17Fp+tI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772033329; c=relaxed/simple;
	bh=Lkjv9q85/y0IAlx63GSgdo5SCl9r9pIFWVCIyxpYs8o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H40Wv0x8CCrjHhzsXY6sHt+1GJPayAygQf6pFcwyeKJdFQi0WYmUjBvWJFQqMSNlIMmjmUDLKz7u48UECmtImgveVRAtgz17bgulxnlk09P4IKwj9rt0RSeIUXgm2Oz9gfPU6FqiYfb6H9hf5MFljbrkRUAIUVDOvQO5QxVgBv4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fZrAv/dy; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fZrAv/dy; arc=fail smtp.client-ip=40.107.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fZrAv/dy";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fZrAv/dy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ld+6j/kfN4BNs7r0C49siaXJn6ErF4BUpyMfZ+3Kg3kPnj1XmHWWf0tDyXUBRDTAF9OVjkECwL7cYQVgqbzBrycsH81IkBxxlVg0EurRZQu/jehg5mcwOwBPr0xxuOG4KarQXOAFpkpG5usz8tQscgX89Kx0+nKfqi0O2xlnN8FHfdyGfGScjib2MBmnSi3LqeCssCaXoMmpTN7h8eEHoRKapHLripN6pqoflnfSRD7rTCfCiBVBjlIi3YTdBYhh/Gmf47MYPgyb0nhzQWbmRHeQ+y4oLG7BB42LLqAwN45a+BFCUcXt8mBJGSSewS0GpKKbRvMY6Ov0ALZaiIiQKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfFYGqixEFxe9alxzZHbPUAyorZdA7SqqNQPaTK4BlY=;
 b=OvWjI+EKJxvypuKLNdq1YEPp0U2O7xUaSQnS9Fx3kBYd+0+lBwqHwcKxsYyV5qSAZKTpVAo9OQ5nd2ZBpCfTCASMtq6jNaOCAZHWKpyf60THo782KnGNuWUZTcCiUF7sY2ZODhYytZm3ozpZtyUdaC4DWwOzuKPsMLBsmWeWFqlumyhnRzzMKCeLJLqd6Wo39JLEfJlvrHdE3FrKKtenPnAFO1rlydPjHdIo7btqxWR/Ocj7gay4zEAafee5OvE46xJ6dO76KIQ2GG6vz2OtJlu6jlvfo1d8xpir36e4rp+jF/68dNbymNYPZ+UN53bD5B8SwhXwroerOSM3njTj9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfFYGqixEFxe9alxzZHbPUAyorZdA7SqqNQPaTK4BlY=;
 b=fZrAv/dyY6t8V0dEH7beyiYFhA14NDhivcog+kyLjMxk7klii/wQRmW+oxyZzbTR48oeQj9yVd2SJ8+97tQgRyN9xWvu9338iJNIQfG0gLSCccx3Tjll3pFNN0S0FoDZ+LiRLCZMVG7cDX8HGRdQebhMikcM5ExeGv9i1wreUjU=
Received: from DUZPR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::7) by PAWPR08MB9446.eurprd08.prod.outlook.com
 (2603:10a6:102:2f3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 15:28:39 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::69) by DUZPR01CA0044.outlook.office365.com
 (2603:10a6:10:468::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 15:28:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 15:28:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+GpIv5FfomAtM3mYW85GWghNJC9NljMnWdjyKMseYGcwb7W2WB1NKrKLmO811i8QK9X4jxHYTgUVwwO0BhBL9cPwRFg8KrghloxYl8CZPtWT4DWGVlVa7IJizDAf031dZx4BHI3KOnyl5bmP/b/EFavqkv0JWqPWyp6jpipI0w9iPoE6A7jl8u+btLex/aXJTKZ9qYjrHjoGUVhwIglMi6/gPLhIPkbvUOOzj5D/3ofKsyYLGy73SQraaLsRrPsCj7qTCafPqgAaKhNDEz97aIfE6qJkDnBT+4+vpVo4LUD2MvYgL/yUSZA8bbjToDa25japhLWPRic4VMlHtWM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfFYGqixEFxe9alxzZHbPUAyorZdA7SqqNQPaTK4BlY=;
 b=BXN794Um9bVvNy/jTHxfDzTWKolsPg8PCEhLkFDIUum1bqydrnTnVH2c23csOfjHcKClQy/aRBqMjSN4iaEIltfwk40AX9b0+K88GpdlCeE5fogp59sUBhia9j2CBumwSTwQMJR/joMvfURvIiyt35oanegVqLd+yvx+bDn7DDy0kLLU/jspqH9z948OjAT5UWRT+7iwZIkJpdQH5+vf0I5x5Z0Keb5y3wR06Ksn0RLKtPReauzHFgT75eMOpNZrcrw8+0EprBZK2Wpt5PR3lFTFP7LxXDiwRnmpqpMVeUojTpx8HfksJHLr0pRQjMyDY5BPHGwGj6nft/a5yDd1mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfFYGqixEFxe9alxzZHbPUAyorZdA7SqqNQPaTK4BlY=;
 b=fZrAv/dyY6t8V0dEH7beyiYFhA14NDhivcog+kyLjMxk7klii/wQRmW+oxyZzbTR48oeQj9yVd2SJ8+97tQgRyN9xWvu9338iJNIQfG0gLSCccx3Tjll3pFNN0S0FoDZ+LiRLCZMVG7cDX8HGRdQebhMikcM5ExeGv9i1wreUjU=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBBPR08MB10555.eurprd08.prod.outlook.com (2603:10a6:10:53b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 15:27:36 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 15:27:36 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: Manivannan Sadhasivam <mani@kernel.org>, Parav Pandit <parav@nvidia.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAFYhAIAABF4AgAAA04CAAASkAIAAHv6AgAACJQA=
Date: Wed, 25 Feb 2026 15:27:36 +0000
Message-ID: <DC987120-4994-49A0-B743-FA7CE4818FE8@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <71d106ec-a4b3-4382-8044-001def36027e@gmail.com>
 <tfpemcac7vkfaw6omv64pilbtdvdehiduwvd4mgdxsrusskftt@jpnczfiakaxv>
 <da9a832c-fedf-42c9-92f7-fa3e323764eb@gmail.com>
 <26A32972-A227-44B6-BC71-C278239A4A96@arm.com>
 <2704856d-8f92-4497-a1e4-ee78212e2587@gmail.com>
In-Reply-To: <2704856d-8f92-4497-a1e4-ee78212e2587@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBBPR08MB10555:EE_|DU2PEPF00028D01:EE_|PAWPR08MB9446:EE_
X-MS-Office365-Filtering-Correlation-Id: de987387-4c41-4091-0b06-08de74828d2e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 4LxuEz+Xo/v81fgO0BybxIRS/vcAhU/t6HZ3/yQ1//uyXUw1UBH7sRc3nvlrpdtPEr6fnxT0YqPz7POvRQU9X/Gnz4o0iQbr73fhRRV38Va++3NbLNc7kzgyxm8tsXjjuBg6Ate+aEEFULcQOmZ5HkFjBYgZjDrv59BNSvSEoh2LVJK1Wo+fvEBYqjDkND2AOGSBOt+ogn5Ld8EmmLEG/vQ/pLAtFT1qtFNTz5eSIBDxruuiYXozVUQQ3AnmpeXRcIRqfgldhSILcYDrhgVoq29X8aEF/gYN8GFtuQYf2D2z8ObAda49NXMDR0SvC78+1RH0j5NJiv7w2Boa0A0gdDz5/UjdSlM4DXNcMuYX7JBSKU29cR3UN9cQS3dghRDU26VVuYu74d8qh+SGmcpuXq0HQm/0q7WEPWdBGJoh9HJ0H7hVva3AGtZpr4VFKXCRPckGovyYj0XRDL8+9JVRYifgosSOryVitMuOmEN0tXCD0O+JJJMfCsvwSU6a31E+7UhylBwklY0Bx+f2yiqWqDSE0yTjMlYwYZMVLfyLDtzR9qBzm4ObdUasyYBa/yBVrRhJvYkrRS9bODLE6MxjdDzhriNCNwoBFScmM/4LBKb93iZ07c0j7fcnZFv1JALMwE6fxfCYbm/howqvBokZJt/qBjfGBt9o7l5/cY3PhDfIH/27b1QlbEeY2b5nefikso8QDZVDwG1cBlkLk7IDUTadWcZJwzJfjRbexQ84ZByJctvEWxLme1rRCmEaqeOyHOKhdjTPPdLuSH8MqP6K0zXqD2qFv3VDwD05jWxx0zI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <640ED3FA2940AE48BDB239CC035302E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10555
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	067a1583-37c7-4c99-48a6-08de748267a7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|7416014|376014|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	El/lSOJ2qlgG+P7ZPOqJN//+JYpM8QCzIG+daXpSgz20oiPHa/TEJMxJ3YzZhmLo0N92VSSWNwlqicfHuV4p+yeLtlxNI2dpnWilhs8+17agnr1sos4hqRLlX5bieNV83DcEKGcemVV2wpiXzxei92YtobNpbfq5HYEvs5JSBu4o+dbxW81j8QhoNMRXIc63LYndA566dkRmmCnyqDzt8IuEkzXlv7kGbJiWW/dqR/urs8Tjg7KgGyjydjynzAixs/GAa4McCxzdNqfRfs4HAdb6YtYsBDG5g0wHygb1cz1z+kjsfo/1bVkoauPjF2kohAB+p7VZw4uAAp6tpdVus/eper/nBf153FJmmegd5+i4JqM9aNMm3h4qgKv1VFfOMf2QaNBYHewxtfXYE7f6LiVpbUU6S7T9QAiJXKfAFFPlZkMCSdBq/TqQL3mt2Kd07HGiKUDsQCirmsUbIPuZSWpS1coKuMriqWqlyf22DrPkwd80Zo6/D5vmH1aITAjWW+rwZ+G5CD5+vHz5LF/RcrmNHQdPArkkezsci293mauL6mA3+C+oT67vs7eP+ZsJk8HJSgkZRGb7gjBq5FYKu42zuBujWoEsJGBHAJ/YOtFFS97yCUYORT/mkoMTjpx+J6gHbjoE7bzFrEJicn+YRwWZjXsp4XqAvbh0baon7EKhD/NtkXt+AKvF231eiJUkZJm/keY8ytJP+yVMBsT561+l45JG29urONbatZw+y8YQdXdFkU4i/KxPZhnJw7PkBnsI/7ZOCWW8gv8EsGZVZf2ld/jXAZ2up/VVabaFDNdF6VloDsI/k6soNWvO8ynZktYKtJSjXOUtqbyvSbCUHA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(7416014)(376014)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6bzRijh6G/9cvUKKBnPOF7XHAebbp0QfUPDV8Urx7EpT3inGn417BGKjp4CZNPZrf75Opt+xh6Cx7dRi2gpAjNA2k39WOybQ9fVyHiBEZbQw5E3QaMdI7Phm8BiPAqdK6z4t5+rK43hxRstV6hPedQG4r6Lxjkxb0cWQ8o3G1coLAO/8mdHNhrK3rj8tpGTiLUclognNjVO/3/G6bN/Cc37Hmpf2dRP1AxGdxHTiaLD3HVYb1lhlen7IEDELK29+TxmJINxAiMcttJYI4VAgJ2wMG5NWFORqBtqoLjE4TSe2KPFgvSZsRH3dHlvhYWf4YWEdGZa9wU3bykqfx8WihcHaVJSnCVS0IuFf3oIunGU8eWPS/RWVXyqqHPmu/JmxhJxRDg/q6LZXc5Ph7rDNqcfbii8/opDmxZ/STaRyrEaKJIYh+4z8BrSFfbiPBrBO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 15:28:39.5364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de987387-4c41-4091-0b06-08de74828d2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9446

Hi Demi,

> On 25 Feb 2026, at 16:19, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 2/25/26 08:29, Bertrand Marquis wrote:
>> Hi Demi,
>>
>>> On 25 Feb 2026, at 14:12, Demi Marie Obenour <demiobenour@gmail.com> wr=
ote:
>>>
>>> On 2/25/26 08:09, Manivannan Sadhasivam wrote:
>>>> On Wed, Feb 25, 2026 at 07:53:38AM -0500, Demi Marie Obenour wrote:
>>>>> On 2/25/26 02:45, Manivannan Sadhasivam wrote:
>>>>>> Hi Bertrand,
>>>>>>
>>>>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
>>>>>>> Hi Parav,
>>>>>
>>>>> (snip)
>>>>>
>>>>>>>> How can one implement a transport without defining the basic data =
transfer semantics?
>>>>>>>
>>>>>>> We did a lot of experiments and we are feature equivalent to PCI, M=
MIO or Channel I/O.
>>>>>>> If anything is missing, we are more than happy to discuss it and so=
lve the issue.
>>>>>>>
>>>>>>
>>>>>> I'd love to have this transport over PCI because it addresses the sh=
ortcomings
>>>>>> of the existing PCI transport which just assumes that every config s=
pace access\
>>>>>> is trap and emulate.
>>>>>
>>>>> Would you mind elaborating on "over PCI"?
>>>>>
>>>>> I can see two meanings for this:
>>>>>
>>>>> 1. Virtio-msg over a physical PCI bus for heterogeneous multiprocessi=
ng
>>>>>  environments.
>>>>>
>>>>> 2. Virtio-msg over an emulated PCI bus for QEMU, Cloud Hypervisor,
>>>>>  and other existing VMMs.
>>>>>
>>>>> Which one are you referring to?
>>>>>
>>>>
>>>> Physical PCI bus, that's why I mentioned 'trap and emulate' which only=
 applies
>>>> to emulated PCI bus.
>>>
>>> Is virtio-msg appropriate when the PCI bus is emulated, or should
>>> the existing PCI transport be used instead?
>>
>> No existing PCI transport should be used, virtio msg over PCI is just fo=
r a specific case
>> and definitely not when virtio devices are pci devices.
>
> Is virtio-msg an appropriate way for a VM to _implement_ a virtio device?
>
> More specifically:
>
> Suppose I want to implement a virtio device in a VM, rather than
> on the host, for isolation reasons.  This is on KVM, so the Xen
> transport isn't feasible, and it needs to be portable, so the FF-A
> transport isn't feasible.  The AMP transport _could_ be feasible, but
> it requires a "virtio-vfio" device that speaks the vfio-user protocol.
> Such a device does not currently exist.

Right now virtio device/driver implementations are independent of
the transport so the idea is you can implement it and reuse in KVM
(which will probably continue to use PCI), xen (which currently use
PCI or mmio using ioreq but will also support virtio-msg).

>
> There are a few other options:
>
> 1. I can implement the virtio-vhost-user protocol.  This was
>   proposed but never standardized.  It has the advantage of being
>   a good fit for the vhost-user protocol, and thus providing easy
>   interoperability with many frontend VMMs like QEMU.

That is a solution if available.

>
> 2. I can implement virtio-msg over PCI, but have the driver speak
>   the _device_ side of the protocol.  This is a better fit to the
>   virtio-msg-pci device, which is going to be standardized.  However,
>   it doesn't map as well to the vhost-user protocol, and thus will
>   make it harder to interoperate with existing frontend VMMs.

We need to stop speaking of PCI, it is giving a wrong idea.
In your use case it does not make sense if PCI is emulated you
would do virtio over PCI or use virtio over Messages if available
but virtio-msg over PCI is never a solution which should only be
used in cases where you have a physical PCI connection between
2 systems.

>
> 3. I can implement virtio-msg over PCI, have the driver speak the
>   device side of the protocol, and translate this to vhost-user in
>   the VMM.  This leads to additional complexity and also creates a
>   specific device that is not likely to be used for other purposes.

same as above

>
> 4. I can try to implement whatever future interface will be available
>   for QEMU to implement devices.

I would do this. The plan is to add virtio-msg support in qemu so that
any device implementation available in qemu could be used with virtio-msg
 or virtio-pci or virtio-mmio.

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
