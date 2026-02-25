Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF1B35028D
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016979; cv=fail; b=H56ZdF/5z+Tq8GFLylQ2Qqd1FzpEPe3LFhTgO9gySpZrU16TVkzzTHqofcI8EZle9QxhyGzVwvH65EspsXYLG5MMAgjIFt3h/4iGYNO5i3Xyk7QheHhqlFTpsteekDqN+xsVLu/GrPU4yMVglcrBwZcTN2W4dmzZNQEy4buU4zQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016979; c=relaxed/simple;
	bh=ZTuF1lLv3fpkLItniktQ4RdW+i3rrH7WOf/OuE8/8g8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H+pr9V6hrqqcLaCYvYYsYB2ajqGGBSkpKsjnhRsJ3HqwOBpb2odArBft2C7CxuS77dDM9C2903DuN1hUex1aJ5RYR6tG4sFty7lQPPfN84x3wT1Gp3wCSsDmXVJk8R93GtX6PCp0B3wAqr7lgZN1F/R67M0kBxKywkM3vAZ/rjk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=I06WrasL; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=I06WrasL; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="I06WrasL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="I06WrasL"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gXaLE/jsg+9BQU7+Np9Z7iDw2m+pzHuMWsG4cQ1EOx7nqItaq+N1t8q8I32Zkzurya+4otK9n967444ZcmCkQA/yPDnXduRx19+2MZXSRzHmMioYMn+t/lTwymp+RtC1P80PLQkNQDQpOSMzPHrEIITdJfUpgd0D4hXYDCqH1EhXrltUP4T2h73c957sX4q1MOWd5fana68Zy3zePoL5NtDzOJHUBnG4wzG+ZG9h0/dGb1xZa72Fv4q76XjFA1cYAft3juuqznCfzm5MD6WLBCqT63Y/76JsErgcOaYXYJu3O2VVFAULIRf6nq4z3z2o1IoT/AgUY4y6D9TZNIsTIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTuF1lLv3fpkLItniktQ4RdW+i3rrH7WOf/OuE8/8g8=;
 b=FZi714hgOkWireyHXeRi8bgy2FnfmajeE5AGCOVk7HSvHegk7uNiI3eKBIw5ih8sd5h7bfZmD3p1CdeI7l6qvIejVCIINyxFGN0VJcdbuiGGgfXo+ELJk9HzGTcTkYcE27vA1u6KF0KsjhEOweyPiUnCEd3Kdwh8B00t/NR9jwThDSQF/AXyJr9esyvPSppOCQgMFpaUpO/Dndh5+3voMxWYe6KYec+yTOHCTgKRMeXVpALev6NmSSvyw872VcyT4oqsdGXEu/tO31Hc99/+SoVAb09VYVpKOb3NTjCVRzH/Ei0MaCQVwSrtLzAWk4rGQbyYLX6lC+HA0ez2vVAu/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTuF1lLv3fpkLItniktQ4RdW+i3rrH7WOf/OuE8/8g8=;
 b=I06WrasLM98ByE3f4+Lb/Zpv2SiGEbC+w2pnEh1H0LE8GaDmI5ce6UoKszqNEHFHivl+83ogLgPFXFkqNxr74WJ+47cASQHzEIpm+zzhDO805JC1YLCEFvNu1ihSdF5VYdon0dRu6pAhHJmQx5A1g5CwwiOp+QphzKuJY8laeMg=
Received: from AM0PR02CA0120.eurprd02.prod.outlook.com (2603:10a6:20b:28c::17)
 by MRWPR08MB11730.eurprd08.prod.outlook.com (2603:10a6:501:99::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 10:56:11 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::ce) by AM0PR02CA0120.outlook.office365.com
 (2603:10a6:20b:28c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Wed,
 25 Feb 2026 10:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 10:56:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSrHacpyfmkO090Y7Wwh+7URqUumK6OOYK1nE8nAZ2g0GwkWBEoGitT38mMrGtZS6/tqCerK0Msbwn+S41lfhsUcQcTfjEREi9D6XF2f/+F5M/CqGRZZimwN+a3YN7GOL5kQYLmxYGoaM7REgCvYhliCFATOcI9/83TDQzOrdCzu9kJva02d6xaQOm0SUcgbcVVSVGAbUj8ZbvrPpwMABZZDqAcrLhOw4j3L4ke81eI3gI63v7Xb+DDRR5ZHe17zZZZDvId8OFfchIap3hblJom+mfn87DQu/IXOIUTfdxVt2uGRAPlhsaCC4Cy6s2zzYXDXsoiy1+ENmPpwmBUPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTuF1lLv3fpkLItniktQ4RdW+i3rrH7WOf/OuE8/8g8=;
 b=myu3w63gcQlbkdRbsrydwVW5ntPII2+bw7/2DaRZ+f64w5QEyMLG9Esg6En++eae26vS+PzHOfN8QRKrgrE58xBhh6ACJLcJSp5FTJf9Fm8NaTVy8LWRMRY8Cm84ODYUDEL1qIk6+GR81h6GdffxuaRwp4Twjie0hBg/BDkmiV2qtivnWcSlilomKnuHoaK42rQXZW3XgLUx+9RwvOdqBXjK6vqI4eZ9vemao19mcmyDvszi6Duiqte9J/g602S0qfcxm1bIO7344g8kA6dfM3GZvHhRBNK1q3qbWHjBPhfcUSpJqGNXK2TlRbbLrGknssSYG6/IrWKaAiP0cZTwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTuF1lLv3fpkLItniktQ4RdW+i3rrH7WOf/OuE8/8g8=;
 b=I06WrasLM98ByE3f4+Lb/Zpv2SiGEbC+w2pnEh1H0LE8GaDmI5ce6UoKszqNEHFHivl+83ogLgPFXFkqNxr74WJ+47cASQHzEIpm+zzhDO805JC1YLCEFvNu1ihSdF5VYdon0dRu6pAhHJmQx5A1g5CwwiOp+QphzKuJY8laeMg=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAVPR08MB9747.eurprd08.prod.outlook.com (2603:10a6:102:31e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 10:55:05 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:55:05 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Parav Pandit <parav@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAAUZgIAAIl0AgAAFBQCAAAMOAIAABKmAgAAAwgA=
Date: Wed, 25 Feb 2026 10:55:05 +0000
Message-ID: <49E4F96C-F23D-4D79-AB91-D132252CB76B@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
 <vigplm62id3vzr3fzekbn5io6qcpeqksgxph6jm4f2qzoripkw@sdh7k6ohw63t>
 <359B0C17-9D57-423A-A229-6CEDA19C975A@arm.com>
 <dyiwq5xhqeoaqmzquzzx4wxsptm6uvrnfgspi6vmcaucq6jn4l@6dvya4te4vsj>
 <SJ0PR12MB68068259D212C6AC8B6A5DEADC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <02226901-7670-4AAB-8F55-0B2FB7C0CA49@arm.com>
 <20260225055020-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260225055020-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAVPR08MB9747:EE_|AMS0EPF00000195:EE_|MRWPR08MB11730:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce4ddb5-b625-4127-8c29-08de745c7cc4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 /WkUp6TOBRti+3y08m66cm+v6pVenSU15UEYPDGO+vVsNjTr1t40gbj3TT0qB1nELxvWHTer9MLdtqq+OatrKG7C4wPLiZAPdSeYA0Hzk0DyWorFbdqAayNsKofwU/kUSGHPpLXWj+ltjBJuI62PynJF6Ju40zpL/nxT4haJ4IiDhjnasDu/kfhnqwbHzx81tMldGFZZq4Ex0LYzNZMgpkLGc7C4g1XlAJY00Jk7VnZOM70Ju9dg/AVF+Afxr6TqIIkdYZFUSCKV3Csta2/+7tk+/Ar7PzpOlnKStEk6U8HMWJ+Nbrmdt0C/pu3KtooBH/vsc9Nc8LISftzX91oaqEOCWApIcR0E8Zk6Eq6z1yQpShTWe3jnUKugS6V3VbgIOLFYxUiiOawblwBWP77D8W1HSTV2JEB+MDx2qhja0av9e0SeiAkUIaMtDd2PPQJ9EAYsS+U0pyOB0mmOsxCha7bUXX+2JGELRNZfPaqma2SfzKdeINkr1IxjaCBbJeHWUn6jk4ayQb/2LUIDegPnOl4EhAwoy8xr4KcNAfrSWrsgVIL8uyFD0D6lhCJnDXQTDKflAAK2Ktec51lsp+bmytU85Mv96YyiUxeoxrrDX2EaP2xFXPbE1RJ8v3jL3W7gThZzPxzLYKEABpAMRj7tSb1Z3S7EjHg9+2d+f1Ol4oK0DoDmifyYgBA9ghQ09g+Rn7JUIQlb3duPyhexz74w91tVu0ZhygkIJ2f/fhFX0Zq0/bokIdjyjJmhAEChhUcssOYkSiJDS2usG/AEGL8NYrLbPNuhG945X3SNHCPMdQM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8AA170E39BB9F14CA8D8486E1C0B6EC2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9747
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5cd92dd9-9908-47ee-9f82-08de745c5567
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|35042699022|36860700013|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	ThxD08w6h+hyetJEH2L0LYjDrpYHEBVqhJ69JenWn98GCT21hKWYb49j5TVy+RALKZwKyzZjF1zeFk5r/QmOktlx/mAzdrNGVoPYKtZULG52/okI8KJQYzcM5gi7Yjq5/zWcZ/RHDRv65M/a2sYzOY+DpGHSXxbXAjAfU6irzXbxyFbWE2Xq6ULKs3xXYvFZE68CtHZBt2/2RGsKVKqit1le3DY2oLjLLcudeG3JqsT/BEXYVI+dur1H9cLwZgZK1eM/yti1MiGsRcjZ5IhmiyXEuKoh57IG489etXrQzFyFrdXLvGBopsPZUWd+3Yx3eB/YRef+2EZs0Xu60izNTGeDODK98jo+6pPPLga+OfXCfs+zyn1sXT6IjfZmVyu+Dmo/kgS2/EZXcVWm7ApM0onB7z1T/5HjKaw7AmTnAbwpkhnwyIcDKQJQtoEfW9HZ8BVdJcr+H/X0IftBrHA6o9e2O86jywo8JMMwFhFCKer+1KitUppKhWYpZP6G+brWB6dLk+te9x+e7m0t+PMrJiB4ZCRNq8cAzMO8w0QABnR/BsUh8Sb/15jLz2Cmni7tIw+Kwiux3biEAZ9JHwMzKEr+qRjh9Do9X/HOLKh/vmGb8HDV/7dfPAM6j43SIsW+peEiVGfs4UdBk4StxJsCjTS1l2JLFCi5Lz2Nu6EkoGCcXbPgkn69Ru6r2545lm1BsPepK1S8304OUN5Rx82in9ZSshaFCYPqhhf7/2V3GnRedh85NT4thB/B7DqxZbmVm4FQ/qaQjWoIILS9ziedq64ZAab91ukH39Eje9wRrQDJmq6+fAPp3HJKBfUn9Xt76YMz+wceL6WYCFk8VSj3OQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(35042699022)(36860700013)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CeaMRZJfhCO5NidZ20jKC+g3T553fsmUDLnHxaATsYkIzOd1FtjGSmJrh73S+QA1nuEP2bLAfq/VggBoPyBHPMhUJ5pEl5H/Ra+jSfeCS+blc3dCiF/Nnso3yFmEkzprSmLP1/QTJfD7+Oen8fGr/d2rSsz6o7eoLgbq/A5wufmppmfUvhH5inUgFxiOfsAwZsONa60AsZrHGjXa+t8iIvl24NfQMQAdsPw1wbZsYFak2POSjKXuZurBJQ866cduIKzgkBmMjMyQ1phcojnC+DSQbcteu6h2pgGFfmAgr1P6fn89k3GX9HNPgA1Gb6RLxbvdmlj13O7bcqSQNhl3hcyt9E4CzbfUNiM48j3Rb5BJFq7HtUabI1R0nRi7WbblnwLD1empyMrsyjWjZ991KfGVdTR4QzmNABaC9VY3fk+CFZKs953xfWnDRNjen1vk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:56:11.1288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce4ddb5-b625-4127-8c29-08de745c7cc4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11730

Hi

> On 25 Feb 2026, at 11:52, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Feb 25, 2026 at 10:35:41AM +0000, Bertrand Marquis wrote:
>> Hi Parav,
>>
>>> On 25 Feb 2026, at 11:24, Parav Pandit <parav@nvidia.com> wrote:
>>>
>>>>
>>>> From: Manivannan Sadhasivam <mani@kernel.org>
>>>> Sent: 25 February 2026 03:37 PM
>>>>
>>>> On Wed, Feb 25, 2026 at 08:03:48AM +0000, Bertrand Marquis wrote:
>>>>> Hi Manivannan,
>>>>>
>>>>>> On 25 Feb 2026, at 08:45, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
>>>>>>
>>>>>> Hi Bertrand,
>>>>>>
>>>>>> On Fri, Feb 20, 2026 at 09:02:12AM +0000, Bertrand Marquis wrote:
>>>>>>> Hi Parav,
>>>>>>>
>>>>>>>> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>> Sent: 20 February 2026 05:25 AM
>>>>>>>>>
>>>>>>>>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
>>>>>>>>>> Hi Bill,
>>>>>>>>>>
>>>>>>>>>>> From: Bill Mills <bill.mills@linaro.org>
>>>>>>>>>>> Sent: 26 January 2026 10:02 PM
>>>>>>>>>>>
>>>>>>>>>>> This series adds the virtio-msg transport layer.
>>>>>>>>>>>
>>>>>>>>>>> The individuals and organizations involved in this effort have =
had difficulty in
>>>>>>>>>>> using the existing virtio-transports in various situations and =
desire to add one
>>>>>>>>>>> more transport that performs its transport layer operations by =
sending and
>>>>>>>>>>> receiving messages.
>>>>>>>>>>>
>>>>>>>>>>> Implementations of virtio-msg will normally be done in multiple=
 layers:
>>>>>>>>>>> * common / device level
>>>>>>>>>>> * bus level
>>>>>>>>>>>
>>>>>>>>>>> The common / device level defines the messages exchanged betwee=
n the driver
>>>>>>>>>>> and a device. This common part should lead to a common driver h=
olding most
>>>>>>>>>>> of the virtio specifics and can be shared by all virtio-msg bus=
 implementations.
>>>>>>>>>>> The kernel implementation in [3] shows this separation. As with=
 other transport
>>>>>>>>>>> layers, virtio-msg should not require modifications to existing=
 virtio device
>>>>>>>>>>> implementations (virtio-net, virtio-blk etc). The common / devi=
ce level is the
>>>>>>>>>>> main focus of this version of the patch series.
>>>>>>>>>>>
>>>>>>>>>>> The virtio-msg bus level implements the normal things a bus def=
ines
>>>>>>>>>>> (enumeration, dma operations, etc) but also implements the mess=
age send and
>>>>>>>>>>> receive operations. A number of bus implementations are envisio=
ned,
>>>>>>>>>>> some of which will be reusable and general purpose. Other bus i=
mplementations
>>>>>>>>>>> might be unique to a given situation, for example only used by =
a PCIe card
>>>>>>>>>>> and its driver.
>>>>>>>>>>>
>>>>>>>>>>> The standard bus messages are an effort to avoid different bus =
implementations
>>>>>>>>>>> doing the same thing in different ways for no good reason. Howe=
ver the
>>>>>>>>>>> different environments will require different things. Instead o=
f trying to
>>>>>>>>>>> anticipate all needs and provide something very abstract, we th=
ink
>>>>>>>>>>> implementation specific messages will be needed at the bus leve=
l. Over time,
>>>>>>>>>>> if we see similar messages across multiple bus implementations,=
 we will move to
>>>>>>>>>>> standardize a bus level message for that.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I would review more, had first round of sparse review.
>>>>>>>>>> Please find few comments/questions below.
>>>>>>>>>
>>>>>>>>> I'd like to comment that I think it makes sense to have a basic s=
imple transport and
>>>>>>>>> then add performance features on top as appropriate.
>>>>>>>> Sounds good. Simple but complete is needed.
>>>>>>>
>>>>>>> Agree.
>>>>>>>
>>>>>>>>
>>>>>>>>> So one way to address some of these comments is to show how
>>>>>>>>> they can be addressed with a feature bit down the road.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> 1. device number should be 32-bit in struct virtio_msg_header.
>>>>>>>>>>> From SIOV_R2 experiences, we learnt that some uses have use cas=
e for more than 64k devices.
>>>>>>>>>> Also mapping PCI BDF wont be enough in 16-bits considering domai=
n field.
>>>>>>>>>>
>>>>>>>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data tra=
nsfer.
>>>>>>>>>> For example, a TCP stream wants to send 64KB of data + payload, =
needs more than 64KB data.
>>>>>>>>>> Needs 32-bits.
>>>>>>>>>>
>>>>>>>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMO=
VED (instead of READY)
>>>>>>>>>> But more below.
>>>>>>>>>>
>>>>>>>>>> 4. I dont find the transport messages to read and write to the d=
river memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
>>>> operate
>>>>>>>>> the virtqueues.
>>>>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and respo=
nse?
>>>>>>>>>
>>>>>>>>> surely this can be an optional transport feature bit.
>>>>>>>>>
>>>>>>>> How is this optional?
>>>>>>>
>>>>>>> As said in a previous mail, we have messages already for that.
>>>>>>> Please confirm if that answer your question.
>>>>>>>
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
>>>>> Agree and AMD did exactly that in their demonstrator.
>>>>> I will give you answers here as i know them but Edgar will probably g=
ive you more
>>>>> details (and probably fix my mistakes).
>>>>>
>>>>>>
>>>>>> But that being said, I somewhat agree with Parav that we should defi=
ne the bus
>>>>>> implementations in the spec to avoid fixing the ABI in the implement=
ations. For
>>>>>> instance, if we try to use this transport over PCI, we've got questi=
ons like:
>>>>>>
>>>>>> 1. How the device should be bind to the virtio-msg-pci bus driver an=
d not with
>>>>>> the existing virtio-pci driver? Should it use a new Vendor ID or Sub=
-IDs?
>>>>>
>>>>> One bus is appearing as one pci device with its own Vendor ID,
>>>>>
>>>>
>>>> What should be the 'own Vendor ID' here?
>>>>
>>>> The existing virtio-pci driver binds to all devices with the Vendor ID=
 of
>>>> PCI_VENDOR_ID_REDHAT_QUMRANET. So are you expecting the Vendors to use=
 their own
>>>> VID for exposing the Virtio devices? That would mean, the drivers on t=
he host
>>>> need update as well, which will not scale.
>>>>
>>>> It would be good if the existing virtio-pci devices can use this new t=
ransport
>>>> with only device side modifications.
>>>>
>>>>>>
>>>>>> 2. How the Virtio messages should be transferred? Is it through endp=
oint config
>>>>>> space or through some other means?
>>>>>
>>>>> The virtio messages are transfered using FIFOs stored in the BAR of t=
he PCI
>>>>> device (ending up being memory shared between both sides)
>>>>>
>>>>
>>>> What should be the BAR number and size?
>>>>
>>>>>>
>>>>>> 3. How the notification be delivered from the device to the host? Th=
rough
>>>>>> INT-X/MSI/MSI-X or even polling?
>>>>>
>>>>> Notifications are delivered through MSI.
>>>>>
>>>>
>>>> So no INT-X or MSI-X? Why so?
>>>>
>>>> Anyhow, my objective is not to get answers for my above questions here=
 in this
>>>> thread, but to state the reality that it would be hard for us to make =
use of
>>>> this new transport without defining the bus implementation.
>>>>
>>> +1 to most of the points that Manivannan explained.
>>>
>>> The whole new definition of message layer for the PCI does not make any=
 sense at all where expectation for the device is to build yet another inte=
rface for _Everything_ that already exists.
>>> and device is still have to implement all the existing things because t=
he device does not know which driver will operate.
>>>
>>> And that too some register based inefficient interface.
>>> Just to reset the device one needs to fully setup the new message inter=
face but device still have to be working.
>>> That defeats the whole purpose of reset_1 and reset_2 in the device.
>>>
>>> This does not bring anything better for the PCI devices at all.
>>>
>>> A transport binding should be defined for the bus binding.
>>> A bus that chooses a msg interface should be listed that way and bus ch=
oose inline messages can continue the way they are.
>>>
>>> If we are creating something brand-new, for PCI the only thing needed i=
s:
>>> 1. Reset the device
>>> 2. Create an admin virtqueue
>>> 3. Transport everything needed through this virtqueue including feature=
s, configs, control.
>>>
>>> And this will work for any other bus or msg based too given only contra=
ct needed is to creating the aq.
>>
>> I think you misunderstood a bit the point of virtio-msg bus over PCI so =
let me try to explain.
>>
>> You see one PCI device (regular, not virtio) which is a "virtio-msg bus =
over PCI".
>>
>> When the virtio-msg bus over PCI it will communicate through this device=
 with an external
>> system connected through the PCI bus.
>> The driver will enumerate virtio devices available behind this bus and r=
egister them so that
>> the corresponding virtio drivers are probed for them.
>> All virtio-msg messages required to communicate with those devices will =
be transferred through
>> a FIFO stored in the BAR of the pci device and standard PCI DMA will be =
used to share the
>> virtqueues with all the devices on the bus.
>>
>> So the PCI device is not one virtio device but one bus behind which ther=
e can be many devices.
>>
>> Is this making the concept a bit clearer ?
>>
>> Cheers
>> Bertrand
>>
>
> So this is fundamentally pci over virtio-msg?

we are not doing anything PCI, we use PCI bars and device as a way to imple=
ment a virtio-msg
bus. The devices on top are virtio devices not PCI devices and they use a v=
irtio-msg transport
not PCI.

PCI here is only used as a communication system between 2 heterogenous syst=
ems connected
by PCI where one system is seen by the other as a PCI device.

pci over virtio-msg is making me think we provide some pci functionality ov=
er virtio-msg.

Cheers
Bertrand

>
>
>>>
>>>>>>
>>>>>> And these are just a few questions that comes to the top of my head.=
 There could
>>>>>> be plenty more.
>>>>>>
>>>>>> How can we expect all the virtio-msg bus implementations to adhere t=
o the same
>>>>>> format so that the interoperability offered by the Virtio spec is gu=
aranteed?
>>>>>
>>>>> We spent a lot of time thinking on that (this started around 2 years =
ago) and we
>>>>> discussed several use cases and did some PoC to try to have everythin=
g covered
>>>>> (secure to non secure and vm to vm using ffa, system to system over P=
CI or hardware
>>>>> messaging system, PCI, Xen specific implementation) to check the need=
s and try to
>>>>> cover as much as we can.
>>>>>
>>>>> Now there might be cases we missed but we think that having a purely =
message based
>>>>> interface between the bus and the transport and split responsibilitie=
s the way we did
>>>>> is allowing lots of different bus implementations without affecting t=
he transport and
>>>>> driver/device implementations on top.
>>>>>
>>>>> We identified that a common use case will be for the bus to transfer =
messages using
>>>>> FIFOs to optimize speed (at the end you need to have a way to share m=
emory between
>>>>> both sides so why not using a part of it to transfer the messages to =
and reduce the number
>>>>> of data exchanges and copies) and this will be used by PCI, Xen, FF-A=
 and others in
>>>>> practice (so we might standardize the FIFO format in the future to al=
low even more code
>>>>> reuse between busses).
>>>>>
>>>>
>>>> Not just the FIFO format, but how that FIFO gets shared between the de=
vice and
>>>> the host also needs to be documented. Maybe for this initial transport=
 version,
>>>> you can start with defining the FF-A bus implementation?


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
