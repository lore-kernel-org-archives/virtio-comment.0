Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E0153E31
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716278348; cv=fail; b=n5FzeQXkZTFQIH9/tye4A2gT12qtg6fPJhXV2HWO/ey89UiMJo64Kadx6SjvKawcqJBIHR8/YXoiLCsKIBFwAzoD8ZfW1mNtelNHHrOCv7qgzK/XLmGUUFeMKzvE4Ti9Cirf2KOZuePCwbW4liWXeoQfzHGP2KeccqBtSBqe+qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716278348; c=relaxed/simple;
	bh=j3h+Bj45SUBTZ2+6XDeKeuYq+dNU9kGmNVxlq8+4Nxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g87bkIQC4i3JRQroMIM6TdbSfJgbneS57P225ktsWNwGoZRjnJHLtKcYNx5cz6qCXTL5Il0Yw36UMxJ+NiOs6KdghKMhgRG29bHDan/tMibExFX0zfPQvCEuIgEGi9zRR1PTbT7NkN52UKzC1wVI0EsVU6KbKduFtxclwnMj4UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LFlS8316; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LFlS8316"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyoigbmDs7Cq+Dxfyqk5J4WtSp01gX5n1JgijShnJZ1CYu2wlNcm8wSe21mASA7RzLvWwfNWsRj/ytAn/+OkTuzC224xG1Srtls8SmrdxbU7wcNn9z99byvpaQ1lmoEUCQ5uaM+Y1ozuQBm0XV8/+jDzKxpeeo4l+6JPPTF2dQZKKwE+9tmEr+xTTgjyWkIYPvnyKsI+k32cbWFjl8tqS3yjGzeO6FKYlI754XwyftzZ2plks/v9ox6dzwyUDP9z7JtjF2UpGsKuWspsHMb3f1oSMkC2cC0689dBY1LRd0cglx7Ni2y8hSaVZ2DtBVpTtpL4dnX/UTCvS920JHiMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3h+Bj45SUBTZ2+6XDeKeuYq+dNU9kGmNVxlq8+4Nxc=;
 b=M2gwY7tZGo/kHmuHUMACjJZR9yi1hK5arW/bI/c24QnKlobTLELc06IsuAnuhkZJ/XLsk+3N8uW+iQuIfGQ6WRoxEgFXZumtxCO4xjkebTyXOJmaz2Mk2QiawmjfRlkADNaWSmsJRmrXVS65Wi1aF21J/K+bVwTRwz6Yvys9YjHAULzPgAZB8siBWqYzEErkXrThH3/vE9edWZZ79ybEM8+zlGm/MA9tQoNI+bEmz8fIt86GoxLeBkiD3OH5Hshv5SA582V8k3/vqy7oQbNUhzprh7AHHT9ILderIJneMqGIkkR8oByf+FyzmATphKZHKjdpzdjdZNbfvynzd5vzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3h+Bj45SUBTZ2+6XDeKeuYq+dNU9kGmNVxlq8+4Nxc=;
 b=LFlS8316q5tUk1uH0vEJP6N9w+SYOY40j5Wc0qYpMOT+AW4JrqOv6KkbxbZtmNwyWjIBPSV21XVzIsz4CBFYNZAX0zGumUmhLKaPvH0Vt1Vx+5ypA6hQ32FMFxrkT1UPtOEx9sQi5MY1quiCTIqiM1k5/pIAVbUES6tBj9heX1qMfGLP2BmMc18QtUnZyx8LDL8XH15j0GJDd/O1tqHQPJUXjlad1cprLrHRqW2Uu/LSJnbEMW7ch3mJY8TyU3fmwOraGU+NXj2joN+dsG2T6xhrEOFVpfk7AxZYkknFsGkx49NW8FcuIz7pxQMgcrMGO5WnuffutpgTuaJqpJfGnQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CYYPR12MB8961.namprd12.prod.outlook.com (2603:10b6:930:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 07:59:03 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 07:59:03 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v3] README.md: update mailing list info
Thread-Topic: [PATCH v3] README.md: update mailing list info
Thread-Index:
 AQHapq3cqOwFBT2zLkCXuuWIgQjcxrGYE1qAgAAFLACAAABCoIAAAYUAgAkETgCAADPxgIAACJQQ
Date: Tue, 21 May 2024 07:59:03 +0000
Message-ID:
 <PH0PR12MB5481168F6B161E51F8251992DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240521032438-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240521032438-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CYYPR12MB8961:EE_
x-ms-office365-filtering-correlation-id: 85db4844-5979-41a2-2cfd-08dc796be19f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SBn1LUpAAcv7caKkV9Hso7R0rCCXkAqAVimeoVZsEdgD+TAQ4O3CTGsaqFsE?=
 =?us-ascii?Q?43fYelYzEsbnWTsKPv+mkycaC2w76tWUbn5FF0H2BOWZRSGCzAv/ViT662ww?=
 =?us-ascii?Q?yXNx3psBIgVrVAsBwMevnseUZ0gQOWDl3/d1jCl1OQ7Q/mFMd2dAVcJaduZA?=
 =?us-ascii?Q?avjPC8zb7BY4EW9p7Hf8NcFHLDYpIjX064oGJ1+lLg8+RZLkvbar1fsMT8eo?=
 =?us-ascii?Q?xRJ5Wh4zy6gryRtjHPjsmCTOelT7INcnPmNb9GNAMNVaM7dj2GSlUD/cFZSb?=
 =?us-ascii?Q?dYa3d3FVIsqr70DdmjkiuOywOzpUR6/gTeWnY3DayGAYPjHoq5E4brT0SkLo?=
 =?us-ascii?Q?4aHWOljDPLf1wwIV6apyg2M5D8AS1CmxoeeOSjiAApfq+DxJyL+2YWyYyLG+?=
 =?us-ascii?Q?PjGxm39x7I2OodNuDpa4lnbxexvAKeXCKw+QpZImsGQprY82rl04MqT6uGt7?=
 =?us-ascii?Q?Rit1vC/SVGMrs7lVqe5BHl6MkBg/UtVsFfcddhu599zMDrmbkrW+uZyj7u8+?=
 =?us-ascii?Q?TmPWKON9jdKlu4r217Bq6Wy9m1blZejdvLNNDDWB4LxvEl8kW7f6LrOdAx/I?=
 =?us-ascii?Q?LsF7q4rzM/CeZ3+cbYvZdbA2FNHxD4xqBv3GcoBgk1AyoMaZ5Naoh2XzaqiY?=
 =?us-ascii?Q?fIUn+E5+4GyXHNfKR914Y9F6GViPVZXgijKN8cDF10VwJs9vCACQIT/zwTj/?=
 =?us-ascii?Q?F7FEC+kWQh/cBuWNpyzxUcuRKwBcVcZXL/ZaYddXvBC9ElamTIgcH/+PdSzR?=
 =?us-ascii?Q?6QE+pFfcHrHMDm3wOdo6vTi6axyps4Rz0YKmlVq4d4SOJZssAkPa6hj/GDJx?=
 =?us-ascii?Q?w6etMl1/91l6nzxtO1kQl6RiQX7DB5NUphIrcTkOCg69ZH7r6GObL2PHeC/p?=
 =?us-ascii?Q?8kMn6dEyaVxPt90FlkZ+etUOHrKF06U6QxNcdtb/5r/dWo/cgOFGo3JmOD5v?=
 =?us-ascii?Q?Mb4BVn4tMiRSnFGJK3NXSpjqRMoPpiG3Gs5RDRLP+OBA5UoGeePVbKztV7wc?=
 =?us-ascii?Q?2+y03w9JsoYJ0r5q0qAER+kxdZPmbtTmk9mhAATxQHNoWHz7d0UBSrkg9BFr?=
 =?us-ascii?Q?GydTDXRde5A+Guu+4v78d7Q4my+I9UsZkDqUrGOBplc747HGPbN085qHbsxq?=
 =?us-ascii?Q?j3EH/W+cGK0TOsGRkPpmdUyd1bUHpTqA0bwUu1ik9+X7OV1v+BLt4nPGxqNp?=
 =?us-ascii?Q?Nk9/zwG1EyxpjPzDBalz7QMwPcIo/xTg6vnHsFX2WZFYAtUJDavYT3qR2V1h?=
 =?us-ascii?Q?t32KglbdueYfKCSa3VWv73Q9LeiBCq/4AWFwNGEGZw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gwmIpftckQAr8delRnA+cPTAP7plLMNyMTdmaw05iP7vL60irYsiYefqSb7F?=
 =?us-ascii?Q?ZN0E4hs6+Z2P2xDhTnAlXCS8XTpeV/YFEsQwtKCb82jbcjiRxyGv8YRFItx7?=
 =?us-ascii?Q?NlVNKqBuWLtq/G4DNnWblW/9C9RhOJGbbOAxQYygOGxIPYwiZPtFXlzhEL2c?=
 =?us-ascii?Q?l0uhHQl17eYYjPRzTo5wXnaKChxbqSReXjiEsvSyAKA8YMzXKkyNVjGscELd?=
 =?us-ascii?Q?C6dQKqM2502Q6BzG0Pm7UnkOzEj5XqBjSZYGdYhnYMg4FhsDsmatN1ZEJbOP?=
 =?us-ascii?Q?bZSthr97wdv9N8e9772Qq1kY3Xut55UbOuDZwAfnfMOtmhQS/qvRV1GMcMi7?=
 =?us-ascii?Q?bdRRzzaeQVypfiN1FUG0vpiBLAFAIyNlbAGxpCEFTSuBTISvdMES9HMbis0n?=
 =?us-ascii?Q?wpB247yMcaGdXQqr3xrgHaEeohAAJucZP+Wd1qFT2MpxtLCHAqgvnRrSzQAt?=
 =?us-ascii?Q?uahe066GfxMMq4togMB5bavwGs0v9KEs1E6n/i4dgxsYwg/Cm8OQQIkG7HRU?=
 =?us-ascii?Q?triTFKHHCDfRfVpOfpqYBhaEwcPLl6xQaUA3FhWuWVJTECVT1Onp9rpf2x2Y?=
 =?us-ascii?Q?RiHKiVekwTL0qR35y9NLGCu/fVi5j0FHvaSmlRnfKhQ31gte5FGcB57iL37n?=
 =?us-ascii?Q?lY1keR9Gwbgzx0t0Ktq2XjsfZ+Q/WhmyHgPQMedqI8EbvHqyTPp/nK3k6Y/l?=
 =?us-ascii?Q?M0n7zytZ87EYmtajZmnV4TmMR3+Y2QmgX16fMGFQ0vkgUZ9Z6LJIunDwyBCW?=
 =?us-ascii?Q?y0Xy1QbwsKQ1rNEvkDR8biTbgeER5PqlVbNizEtrXJcO1wHl/HSxKbd+tNte?=
 =?us-ascii?Q?dven3/hZp8BFAzhOclUFkqolm/W7fpewWKgr9E2wxIosjIrxKbcCf7UxBOdp?=
 =?us-ascii?Q?dNvR9do+ekYOuHC6vzSgjyLt4Q0nV2fY6OnkEvzQzK7OAh5PsR3dLjusTZRJ?=
 =?us-ascii?Q?WSz+Tuk2Af4Q+vukKp63GHzyZEPgOCzGVR44yRlf3P/Updmjkca+NCjkRqQq?=
 =?us-ascii?Q?/F9ML6wqtiCJ50bAnLHSV+tRZQTthCmKMFrdpNIA3HNl+FRI0C39rs1FNr01?=
 =?us-ascii?Q?a9Fnr+A+H1zVwqVh9pIesvTh2Qe580YHTDFxf6FQ/tMqfirnijt6hhgZR9K6?=
 =?us-ascii?Q?pW1+st8/ePtDeazxtPj6FGKen6drJ5lzGYH5SYTWD4JXlsKDTI/3J2iQSzpY?=
 =?us-ascii?Q?jtIPWOsPhm1OOl5CV5axXLYy496Mbr7J0VNip8dfYlDj3nPsWnn+uWVOiIqE?=
 =?us-ascii?Q?qQgZ4jxAn+9ARbzsuT55UK2eVk939Pt1Zf0xFUeGe6T1sl61kgKCnve9lpJW?=
 =?us-ascii?Q?Osh6KuYi7m8ZNVUBLVAAumhqBvJcpjaoAkybV7o/J0JHdhZ5zeQd0UkrQL0R?=
 =?us-ascii?Q?Zs6gUnHgmJEbKrWtQmmGwrXaipU/iyJAdB8Z/xlCFOA7uOsMzgYtNCRJF7ai?=
 =?us-ascii?Q?AeNTTIMkqttxUx8xYHcUCd7wfTKORi2LX59q5F485cT2a1UWeS+5LZlThVmt?=
 =?us-ascii?Q?Y3w6pmu7Mapo4nyhgYDAYcIuwqZ6UfXIqizj0bDllLuNrp1bTBp6UjL8bzeT?=
 =?us-ascii?Q?VELp1BSg8XXj4bUXctw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85db4844-5979-41a2-2cfd-08dc796be19f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 07:59:03.3025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AsbfO6KpFmRcZf0CfJ2s3KgVf4+U7KwIdovGG7+Q7hwmLcnE+77GUz0NOCcY1he0owhkJkUJHwF0vtkhGnCp0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8961


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, May 21, 2024 12:55 PM
>=20
> On Tue, May 21, 2024 at 04:19:31AM +0000, Parav Pandit wrote:
> > Hi Michael,
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Wednesday, May 15, 2024 4:07 PM
> >
> > > > > I would wait until next Monday at least. Give everyone time to
> > > > > subscribe to the new list.
> >
> > Can you please merge this patch?
>=20
> Pushed now.

Thanks Michael.
Cornelia mentioned in [1] that master and 1.4 should be merged.
1.4 is 17 patches behind the master including this one.
And 12 commits behind..

Can you please merge them? Without it, there are conflicts in patches.

Also, we need to update in the README.md on which branch to use for sending=
 the patches.

[1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00087.ht=
ml
