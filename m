Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8130A3B8BA5
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.52
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032403; cv=fail; b=lg9wpVaCU9v7P0aIaQG5PN2ZGpTpTTRQJzg8lUM1ABWm1oadsaVFHFaoG2K95Mn9lRL6uctNrEVhPfsySc3k78RhvkYNy6ULWPGWR2/2cW0ClyKpdbVDGQdEZma/ONXJ0mB/VgDviYAVN7BKpoQdbASTIrhN1NU+u+Dyntj6Kvk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032403; c=relaxed/simple;
	bh=FzKuZP8x/90SdifGmaXlk4JTZxAbC/eVszXTUEOcppc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UnvzuGBUn/lvhESwholoTHw2EQ5O+eAo9lLq7jIBdjFjPASyGIdYnsz0DkqAmNGbgDC2rjsifSQVeuUAJiaCSUv9BoGs0bB6RDobw7sRNSfyjavlyTOFzPMexqSxSNFREH6NJmw9oqjyAltCMMohtdw1v1KvYrRqWUcOY+3R3C4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=heBNad+a; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=heBNad+a; arc=fail smtp.client-ip=52.101.72.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="heBNad+a";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="heBNad+a"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xO2yHy/kLF6EGYWTdBvo6Cnz6gUlEOSGPtdZyUtZA/yQ0VNgKH8WzLtfuqNVg4Gqpee2NJn2/YTSpZ16v+Ix/0DnBlrG4S0890yjzK1T2YIFghXvuRht5kOGu2veeAA3tBpvtbOalo3zbTe8hJR8t+T1ejcxeCOZS63oaZ+LQQoMqjjDiUJ3BsmZixzctMHy3BAKAD12DX20Srs8vPrpONrZa4PRoGMhwmdSibdznK4j0hAGKs1v3De5d9M04F13LiRutKmBzQP46yCArudK4ZQo4vyDbhBJj6xU3CYNEjbRxqlnGYY6XuRQZNQcVnIPyzFCXQc3YM7zKDEUz8r8OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzKuZP8x/90SdifGmaXlk4JTZxAbC/eVszXTUEOcppc=;
 b=TPHpr9V+ZBmoH/0ZcI1fT+zvWOULuUmL5ayc5MJ2T1ED+60XqaWAU/o1pY/3tqOZPPZXDEbLzKF9/dn9EEt6J2H6KlmlJI//Tzz2V8qrcVHWvQRc1jHz31bwPqtdAEenEXczjtIKs2PqqnOGrpcGqqrKZtl0zxJJO1XiMBnmK3VurHMZk7pfXb67k/MAnKqcF2UaIju/4fRlRpyOjPwJabocyizDocPbSa0zwpFEByHvwmjDc1NaZz1DLRkSriQkvSaozsIk0XadEk9kTQJuKKBmZHXhZRnyQE7OXPAC5JeI0ANfgunQw+LZmkDnHU/IZPAs2+SVgugK6cc9WxEKDw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzKuZP8x/90SdifGmaXlk4JTZxAbC/eVszXTUEOcppc=;
 b=heBNad+adKZzi7NvYTEgAWQtvHogof52dhOEAu3ROSJXWn4qlye8t+AMvZsxpkCR6kyLo6ixUR6JUFIdmMDMjCcVYTZbunFxuFz203+5AhFNJdxV9wCgWByi56jmh8/lQybeGXAfa9CDviMdTDkDt3DSGvQVPxWGOwUdkyTelk0=
Received: from DUZP191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::7) by
 PA6PR08MB10568.eurprd08.prod.outlook.com (2603:10a6:102:3ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 15:13:15 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::14) by DUZP191CA0026.outlook.office365.com
 (2603:10a6:10:4f8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 15:13:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Wed, 25 Feb 2026 15:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMMl7cDehE/u372BFeybowBMHZR6knV4dsh0I02tVbLjsCEj8NyKMEIUO/+nxcEVMs2AWOq0MXB6f2Z72YaWVGcUh77oBCEpwGbyaz0ilkKm9equfQHAegdOkqOlRFWGXNXLF7yxNWoHY9wYGKe6ytuDAeBIeN3DWDY6jcl1FBC8sFxCD4DipjGIwOuDOQhrZ54rPsRFg6BwS/0ko1OOy1gepPACvU1QG/vP78QrHbNLODVaslJqfAcngEQ1lLTZjSQRdPidg3CMekaRRtcE6/uYPo3oeZBg4tONYZiCqSWWB3/hpNYDUPZE+x0pqU/ytLa8fc60lXXxklcHJH4YkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzKuZP8x/90SdifGmaXlk4JTZxAbC/eVszXTUEOcppc=;
 b=qBz3DjKHVugcYCaohsC3pisPLcFj/rKoYmwxQFoCb4v4+p4p/S/2cGU+hmLSH/TFGdt+evJAm5FNtBbDTE000jKuV1PAAi8uMbnMIqBRdRgWKW353vEisNaHPiugROpIIWIGk+KgbeJvmZRKXZi+MIY/qwTpUgsCnIyqMCBhGciNlSsFj24qPa/chQi6zF8UdkGwr3X2s3aDWsuYsI+qAv9EwYsA5pSDRtIxZEWbwJS9QuVsR7lVMpetOXG3+5yWb6vI0lk7agPsTBmHfgFOq7HD261JnyrcQvCQcnJbZGSdFGAHbKAc2LFlj8DnUwwExEIvQq5eI8vQzkTcpRxxiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzKuZP8x/90SdifGmaXlk4JTZxAbC/eVszXTUEOcppc=;
 b=heBNad+adKZzi7NvYTEgAWQtvHogof52dhOEAu3ROSJXWn4qlye8t+AMvZsxpkCR6kyLo6ixUR6JUFIdmMDMjCcVYTZbunFxuFz203+5AhFNJdxV9wCgWByi56jmh8/lQybeGXAfa9CDviMdTDkDt3DSGvQVPxWGOwUdkyTelk0=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB11358.eurprd08.prod.outlook.com (2603:10a6:102:50c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 15:12:11 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 15:12:11 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Parav Pandit <parav@nvidia.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Manivannan Sadhasivam
	<mani@kernel.org>, "Bill Mills (bill.mills@linaro.org)"
	<bill.mills@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "Edgar E . Iglesias"
	<edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index:
 AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveAgAfGPgCAAAUZgIAAIl0AgAAFBQCAAAMOAIAARd+AgAABNQCAAAEXAIAAAdKAgAACEACAAAE1gA==
Date: Wed, 25 Feb 2026 15:12:11 +0000
Message-ID: <E24A071C-02D3-4465-99A9-732FB4EF49B7@arm.com>
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
In-Reply-To:
 <SJ0PR12MB6806151DD9BF3AEF3839FB62DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB11358:EE_|DU2PEPF0001E9C5:EE_|PA6PR08MB10568:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ebf3db-ab8a-43ed-6b58-08de74806604
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 /LtHcBQ3HG+JsQsMyrpvSaDsdur7k/x5EY8hOxkH+4YHvOBgMJcJ4iNYC14BIGBhK+mlrxLZvSWFohSP3iKNJft6TKbIb0cJiEZY993UhoDjhXuYB0ER9xlaDii/gIhPuwgYkVjHsQzUrJRh1wyeRs4OcmJyBpQJkltnyTkcwXQuNkdJbtqn5O0E6moC3H2gEH7NVABYAV7enM2+mN5NmMLDYNT5yYaOvUiw3hEtP189j8vhfgntxELEwy+vI4pYLazWU6Mbch8882d038eMtqhc12Rgek9xBpNk8mTwpji7iRiPU97henlexdDL65UeGsX3zBeLaPqmnGqIpU2M67x+JMueGS9JBsyprCuhmd090COHLS/BxYHZO0x0ESNxOebaz6x3k82eJ46ikQPdipjaFpMV2KV+rQTFeGzLJEG/kgR+UubDzXR7FVjsTPrKADAfo+asGZ6FpS1fiRPl8pcxnxBnnyurtcd9aFOtGWUVaOMfm7tuNQKvW9EKFDavxi+tsq7lWD9LDuYxmFcjzMYSenPjpSsm1iUmCtWYdZiZs1+oRCEfd3nePXluaZs3po01aPdyeY4EbhJ6O7aCJr6nFtRJFYGtZO45EcwYIs85JlckTU9OKSoS7gAYYpfTA5NmbOw14cAGTwf2/j7CAAUtDjWfB03Tm+CY5ZTHBe1AQwilIvGGSNhJJwQqtboQtM+Ez3jR4UvsNCDEMtJWaQwlc6G90cObY6ZcZJfxuEah2+FgWEKDq0adYrGjv4uwoWNqcHKnPQ4SJ7c3SLiG+gJargkEdCmJMPob1nVXsM0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD6750EFA560954F8B23A52F5E61EABD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11358
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b548551-2bec-4ca7-5a86-08de74804067
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|14060799003|82310400026|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	+yEuEfYxWTnz+23Qi+VIbmuIT5xn5XM4DO++kS5/8jgSkHn9QvLuwvi1RyGx/45O/zzHi44G8kYw55Rj+f1+I+Esy44tO021HFG0+HuH6Oh4OhIwmaZOZNDFmBk9ZreVk9+ZJAKULnT84jK2ZZ5M4sRvLGfsRMgefv15hFe9c3vjMOTKp9d/v6tmL5OTxt4YgT2EhtKzzDrE2r6aYX85nEMUMrNr2xfdmRDXNngZ56NPCzusvZ5Uxx3zhSjvts52JkWRXb3PlyTGjxcZBdE032yjFdEA/7VD0MultMFiPI/bU5sVMvHBaBQqdS6OnabEBQex7MSVvJD2sdnWvoo8O/otasm0gnlFGSzOusx6oG/Tcmkwi/6f/Tjs1GA7CERChGLXqfei0rKEnk+6vNzxtc5lce9eQFD5vZYJ/jFRsFgBEiBfFm7d/FRbCPJIaZerJ75HfIdAZvlpzNtxhErENH7NHOTZDEz+N8/LzFbScPQzZIWEDVC1ZMlV8Gpqs/KQoLv0/8philk0vBgLezC+vziOKIDVyfmS26DzZgU9QxGW2435dBmP+rr84gDGs82N4Y6cTZUghDvmz2YHlzmTnu1qTfwHgQQwlF1KgETI+U8kSiXZhUtaGjatWJ/Eh12x2bZDpEoIWuXJ6iCze0/rQPWplzg0rx37KSx5WcVQnqUtcE7YHZ6vHLPw4S05DCHYkZN6SyZZtrfb8fM8lsTnxZwlvr8fsxBjaOIG2LjeCxYDSsj01B0rgy5FvXEVg2E1d/EjnKyD8WWQgIXmKwFcmci2T7WsEdnuVGDOzR5Ho4jfQ9qMO7jy29WMnB5vS5UE+gRv1ZQY+nzmjwbTZxa/Zg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(14060799003)(82310400026)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vlBIuIsy16fr52IZuIGZlN9z3xenF12cQnhyF6QBKooYNq6fOoURGu6hzOtgX169qIHEEbyCF9sLuunOdjizdKooDPuZDr6qBq0D9HwLXU1cDKN/FOcBAO7ZZV4+zVprxVwitAUk8Y971O+XEV6ooU3boO8A7AfWc2l9zJVjmW9Jpu0nDcpP1+OgaIQvblSMc30o/E6JShbOeK81lHbHsq7/gU+dAhxT6IG1pLW/OUNaGUjAvODnzWg01NDblo1sLZMmg05m/aItymQgeuUgJpdhdJsbKY+9vRJ2VOVNr2PGbyz1G4zn84qxC1R3rbRCcEpQ7ZIgPy7hqthUfdZ66nXTCGwmdorARXMNi4r44tGG6mTz6iFwKQKOX11sHAJwzJsUauo8exOgFVD/QDGPPBcsC0ZMzP4YCh0un+/8G6eFKacswaBHqxZOB8GgiZCI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 15:13:14.8373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ebf3db-ab8a-43ed-6b58-08de74806604
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10568

Hi Parav,

> On 25 Feb 2026, at 16:07, Parav Pandit <parav@nvidia.com> wrote:
>
> Hi Bertrand,
>
>> From: Parav Pandit <parav@nvidia.com>
>> Sent: 25 February 2026 08:30 PM
>
> [..]
>>>>>> So the PCI device is not one virtio device but one bus behind which =
there can be many devices.
>>>>>>
>>>>>> Is this making the concept a bit clearer ?
>>>>>>
>>>>> Yes. This makes a lot of sense now.
>>>>>
>>>>> This is a virtio-msg-transport device that needs its own device id in=
 the table.
>>>>> And its binding to the PCI transport.
>>>>
>>>> ok. how about an rfc of that idea on the list?
>>>
>>>
>>> I will let Edgar answer on this.
>>>
>> Sure.
>> Also please explain how is this different than SR-IOV devices?
>> On a PCI device there are some child devices exposed using some virtio-m=
sg bus transport.
>> And all of them are going to share same PCI BDF.
>> These individual devices cannot be mapped to different VMs (secure or re=
gular) in a performant way either.
>> So what would this virtio-msg-transport device achieve?
>>
>> If there was no PCI bus when implementing the virtio-msg transport, it w=
ould make sense to avoid trap-emulate story.
>> But underlying transport being PCI, its back to square one for the origi=
nally described motivation.
>
> If the objective of the virtio-msg layer is to really support FF-A or sim=
ilar other non-PCI transports, lets please focus the discussion on such use=
 case and binding of that specific non-PCI bus. (like the link you pointed =
on arm site).
>
> This would help this series to progress faster without getting distracted=
 on PCI side.

Agree the example of virtio-msg over PCI made the discussion divert a bit.

Maybe focusing on use cases like:
- FF-A
- messaging unit + shared memory
- hypervisor based events + shared memory


Would make the discussion focus more.

Cheers
Bertrand



IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
