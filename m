Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E00D210E4
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 04:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716265176; cv=fail; b=JsKThFMs8TbkMdDX+2O/uBaFmU39JvhDkyUDtSsFANxxO6UMFGK7e2g4Ageky1IGgdS5hemqy6zo3QfuP9wViDNDXI9AFVlQSbnnCZCMhB+AW2mZbpaONRcLniRxfI/8gZA4WhQiD1K/PfPNy9m7c1nbqA4Q6UOQnNg/Ri+uOuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716265176; c=relaxed/simple;
	bh=T2FjJZtZooZZFeKySF2vPDap97RyI6cg5OmJ1Umkfhw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rd8E6Q5w6bdJI7caKR5cL3NsMG7yweME9eW7HAZDFmbH97ydcqiSMEItzP05fjUqF0kv3nWJgDJKKOaVaUi3XjtbK1BtJt9lKKg4MDCom2LWz1pw3ECUCm4fFTRhYmmOVd1mqotdzW/WV2cwbInmddngqyP073oUSVeF6ydeahw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AN8v7YaM; arc=fail smtp.client-ip=40.107.236.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AN8v7YaM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZPdKWeZVYhP2PDqR7zK3gUzyEAtKHFievNlSphaxzikq1i6s6lUUPNr585naXwfKxJH28QEhh4CFwFfTUcUcqS5q+O5ptpY+SqqUf2OmY02QxAL2ZP8RAH3YXahk5FZexFIUtyRgy16hPUnQaYvyh6awv5QOR7kGuzMDxls43H7+y3+N2bt8G0L/UuqcsmugLRX9OyokAYn09P0ftce8/AElxNK60Y5/kg/4f48VjgjfC2kWNFMQ2FIotJmAzuyOQ99gYpVatXxjF8m9UITuQ66qfA/fcMbGbYFS0vl3ZMal3upY2qhSx9qGaW2ICoecwv7Yt5Wn963zfsVlQMdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2FjJZtZooZZFeKySF2vPDap97RyI6cg5OmJ1Umkfhw=;
 b=YzOMIfmYqRR9prqhLiBVxN/FHw7hi8bm5fmkkuHXB+QxP6G+Y6M92dYs5A658fhp9uwx6OCx9Pn85XKVX22Qg2snhd6h296zRx6MJ/s6/DJJR8uUGOOjYSJK1f0jFAH4jVxvbPBkZOPloeQq0nRtdMxNIy5BQS1v0iskTGgDoDoRiNkx3NaUYYBrD6ztbiW3E+vdN6H0WeZUs0RB8/UP+9zJHPEV20vxgsKg/sKusMil/UtR/LUKQZRIyFX5PwYhAM+V6hsLsU124XHlsjP1z1ytofbtX4y0Gs3uo9Ch4nrc+sSyIko8Fjnt6kZCNV+1wMA0HLq2jH0/onSc3LpPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2FjJZtZooZZFeKySF2vPDap97RyI6cg5OmJ1Umkfhw=;
 b=AN8v7YaMJ9C5DF7BvnglsC4tR/u16Bnm3QJsNKJC//JNPqT43/BQY6HUDsr0Utiwi3k96NifOtCsTaQkJGaPxmnl+kF5yTkTMs1Qz4o/gfdIN/Ut5PGeE72Dx5W6EphZHWLaXobl06+Ch8oLlyQ4lhfjWSaWcorZSle9ibmcYuoAbZDviSvp5NtDeOq9xaWlyHV9najL9ndC9nEUFDJ6H6UCpLwHJDKar4WW+XDS27FH16BJn7NIzHAAJJFha2pS/BZdMaVYs4zrmMPSUlLgWosa4n92LkVuAi8Q8a4UfsBcQbz2C2Gnhj8bOg6Bxr9OyZd5J/2743AbroQ3bA95ZA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA0PR12MB7724.namprd12.prod.outlook.com (2603:10b6:208:430::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 04:19:31 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 04:19:31 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PATCH v3] README.md: update mailing list info
Thread-Topic: [PATCH v3] README.md: update mailing list info
Thread-Index: AQHapq3cqOwFBT2zLkCXuuWIgQjcxrGYE1qAgAAFLACAAABCoIAAAYUAgAkETgA=
Date: Tue, 21 May 2024 04:19:31 +0000
Message-ID:
 <PH0PR12MB5481A1F599028CBFAB58F594DCEA2@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <8f5db33c96d685fcebca3579b05d09b64dd720d9.1715766697.git.mst@redhat.com>
 <PH0PR12MB54818B506EFE9E4ED61B4294DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515062910-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818853B8A407B6F2A3D463DCEC2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240515063503-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240515063503-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7724:EE_
x-ms-office365-filtering-correlation-id: dfa852e2-289d-4291-48d6-08dc794d3678
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?9EKg0b81lsfi8DTYqRoZGE426KwIncyxkTRKJs6oPmXuQtkaPvJg2ye0lmbn?=
 =?us-ascii?Q?fUiiIGpoAHN22cP7ANj1hZUXj/1F+ipCU2+WxcwOGNpu/qYZlVV5N2SQ3vv7?=
 =?us-ascii?Q?5NZ3WpY5mHR6+OUWW8BZ9+wiOjT8iJd69Eu7jJPh13zFEaio2pbD8B2RB56X?=
 =?us-ascii?Q?to5ozN7xKZHPtsSrc8I4rMmJJLS5DLLFbKo2ofl6HpTIICbZPhrfb6NQ+c7L?=
 =?us-ascii?Q?oDjgpTZEEuMj1yDG2jJvkycoJEZWKFhiU6n2tppgObZFzvu1vl6PJkWjWX81?=
 =?us-ascii?Q?OFw4F3Aq8Il/+Zs7kfdrLp3/5xkFzrYcNJJ/sMHka+12VmMpHRBW1+BZwY6q?=
 =?us-ascii?Q?4oRS+PBWR53r5MUuX1yQWJ3Qf/ugEKzEA/CuKKucmJAh2z4avD7BKXge/gwV?=
 =?us-ascii?Q?H3HbtEacqxyYhNy1I9TMYpRkY4CCVEbpaQBv6FKyVRCaAnEZeq02fqoUt582?=
 =?us-ascii?Q?oIwIDACywC3ajDtuvVY8YxKsHRA3C9eyy1nXlqNrXx+BvbSpcrrvqtMkoBKt?=
 =?us-ascii?Q?ztB8py872a6USEoqMDRtboOoHvIYrfCN9/IY44JV5/XZLApLM2es2L//qOg4?=
 =?us-ascii?Q?RRl8hxiHUOF7jCnbkFFIYRk+yc0g9AKPEPXYIPW8nxU4bhTuvtNtxxeMmgsA?=
 =?us-ascii?Q?+xC8O3F12fINdFggm7woThXyQOijhn/TuqucxgtjgHt72Ddxy6roqZ1q9Ucp?=
 =?us-ascii?Q?9G97hQstX1V7xJ9w7jPQLek+t/XfSHWocPSRv8WSUvJDp2uJDjx4tBhVggqg?=
 =?us-ascii?Q?ZZu7zNFOwgvfYEHivnrGLg2SXCpC1Ejkx+Ww4qA2/eYTEEPIeOtVvAMgdx+I?=
 =?us-ascii?Q?gSvSkNpLGoShjCltcu/YMs0Zlub6Ggo8vayKrQ+5XHFkcRh+2TO6f3EaKlAI?=
 =?us-ascii?Q?EuHaRh1re8K9+yaffVt9Gl7KWDyma0oVvOCY21lGX8P2B1COV8HURRUBZf53?=
 =?us-ascii?Q?lg4HuxDpD8d+0ZSB6Onw2iren17S7ojdvhGukD1cbVo0T/WgKAw7UwJi6n5m?=
 =?us-ascii?Q?yHaIoYTQPcH683ssTpMB3Q0CK2R2tRsjINYet5/z0Rtv5u0alXxIJO0jCNT+?=
 =?us-ascii?Q?9eT4LtVwGJv9p5F9jDUS3eUfHn1ewB3TYy8TfcvFT85BzURXMZSrTrWPuj0h?=
 =?us-ascii?Q?ryJ3dBg7BIc9GZy656mXghX+gU9RWulqjtygDTqlIdUssVUpZZULRM0blnnd?=
 =?us-ascii?Q?3u9FvSZrN3WKGaavI8iVLmzEQ3zq+3nmN/F27Qp6I4KB4MjNB3MmcKqbRwnr?=
 =?us-ascii?Q?Ba0V1iLkR+euZ+F2xBi4PUDBH6qhgm78SQdJuvYXsq6qU6IY2k8M+p2TbNS6?=
 =?us-ascii?Q?4oLbSU8kwBabU8n9uUXvXNYAmjzatRDEU53r7nuaUb+Ilg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DAs55Hl+6NwSPZiso5A8L8lyzKXemxZJbCBmbCTI6rrGqIFKLQ6F9sZqApWf?=
 =?us-ascii?Q?fUggOgWMIpBTcB1BJaxps+1qFUaF8DyMhZPVFPun7UviKd99R3Ke6lSLtTpe?=
 =?us-ascii?Q?95ZbD48ySGTImlqDFab8RwqY3iNJKsFqZ02/YZyhkRHHjVKbw3wXGzE753fZ?=
 =?us-ascii?Q?HmhDt9vg6HokbXGHb+wtpcz/7F1arXroS6p6IIOY9ZiENJJ8uemXhBNbj6P8?=
 =?us-ascii?Q?+Tqaf14nSc1raL5bnimjDwUoNB6CApzxBOMDG4/aEsb66ZCyaBVYfejktCdK?=
 =?us-ascii?Q?tDsvedIr5eJhif9P3pq9p3YF4d3KF25N5A3DcYLzH8lHt1oLLFmI+A73+7dJ?=
 =?us-ascii?Q?QbEwOHPYs248eF+mNiRq7JYHDK2evJ5G6N0BZg2t1gitO3Ovn4XThfzlGRBN?=
 =?us-ascii?Q?aExhexngOhNbP451PvG7kFly33kPWeQ2gUVqVGytW8lbawAB4wl/w+KpDc3J?=
 =?us-ascii?Q?oHSu711OvHgYR6HA/6jkZjkqpLMBHUmu/TZ4YgvAWIWwe2IgYLZG7yETk9u5?=
 =?us-ascii?Q?+NMOFpBPi5GIa4PUrVvpcZPt5FXkKuN40kGC1GHbNXr0sjNNOEVHYnrVJWCw?=
 =?us-ascii?Q?js/u+fCReY9XA67eYtA5l2mz0ZDzqWACPiJbR2jslwbcmtGq3HQ0Z8SAkb6B?=
 =?us-ascii?Q?GD921gcRmPpKbHcP51oTDThY7uejsBvtZL6UyNf6IY0lcw6u5KGzxY0rU8rq?=
 =?us-ascii?Q?XXV1raMeBpS48405moqr87ytqKcyibwQS0nWBbFIYEJ06gR3nm7E8qLXui+4?=
 =?us-ascii?Q?2q+IWKy03wsRwkMSW0ZbOfxTJKFRCx2sfW8Bq96lRBKKqSWoLsbfD+GrCBqW?=
 =?us-ascii?Q?moXq/meXHbUYNMDlw3FPLst3eB7N/rJP0ynEOjAfRY652aROhNWuNQxT/jyB?=
 =?us-ascii?Q?F1LfkEDCRHqYo4eFuxusLWDQe6KGxIzEktpVH3LnXH/0vz+6dQ4fiXGMboVH?=
 =?us-ascii?Q?rBUrmVaJ0dOdEapUegxxKFk0zIsGIUYl1WQyJWI8lM4UtgdK0L7vWG6Xz/Xu?=
 =?us-ascii?Q?bMbL4yKbKTlIGkh3kRLuZ2pp3BFaM74qZzuAMYKIkCgLvW31o/1KO0EDfr5o?=
 =?us-ascii?Q?IiZQhYfMy3sQqaR9+IhHKnAv6hFXw2qixnjgd6FXwLKJO4hBHPqMEF6y/5CQ?=
 =?us-ascii?Q?+7U937PyZuZJKx0l5Tr/BpUvGvaimjymx0v+MmlnxpDcj6ORyAiRnYBH9nY1?=
 =?us-ascii?Q?A3wBtEFkY5x2EGzXK2Gh87wmT2xO9RkQI9JFlZnVM/rAHWPf0ZwBjYetLl3D?=
 =?us-ascii?Q?jHpPy/SxjxrrPBYx28XCqAXmRiudPkx2Z8dg5fJPpwhhe6AGw82K+GgnRIFv?=
 =?us-ascii?Q?tiw6Cgo2di3PI8Gq2TGlnqof8F2G2qc2/8Q+q8dO4UI6a8Mk9L+IA9Yn0u4w?=
 =?us-ascii?Q?6Xm7SaIe1al2hf3X1WVN4ThLRwLapYhYaWRhazpZ3nNSNyiAq+asdX6eWA1a?=
 =?us-ascii?Q?OnKtMswVbrl6J9H1Y+fZ7rQnSUE1vTx4AgQipEStCUctseLCDcO0U+AN+OeU?=
 =?us-ascii?Q?ztHwlHhX6hmxLuVbNW5z43K1xyFVw+vCYGmYK4l0Y0J4sJh2ktrJRuEqnTg6?=
 =?us-ascii?Q?fgRrxpGn2+7aSTcGGiI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa852e2-289d-4291-48d6-08dc794d3678
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 04:19:31.2749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SRoz+vLa0/cle5/Dn0u0Kx1Wmr3s+qM3WJUU/fMfg1JuBBIZfNo9qWIHPKsj//hwD38zZjHgSAelk1HEFelpiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7724

Hi Michael,

> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, May 15, 2024 4:07 PM

> > > I would wait until next Monday at least. Give everyone time to
> > > subscribe to the new list.

Can you please merge this patch?
