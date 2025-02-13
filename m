Received: from egress-ip11a.ess.de.barracuda.com (egress-ip11a.ess.de.barracuda.com [18.184.203.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD5F23F417
	for <virtio-comment@lists.linux.dev>; Thu, 13 Feb 2025 13:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.184.203.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739453072; cv=fail; b=CraYlByQ8c5tGxRnf0xZWzAK1EMQrwYu6Br8+2w5kKqVPpfme+xh8bXmrXfy6GFWjXaNihtlgZwTjhpD42pThczNLBIVvHIn0fO1GJcoqyzNwRX9vGNq7+N5g9zfZdqe68TZglI16aCuVaArgTymVO7nPnFyZ4xLMTkcISZa+PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739453072; c=relaxed/simple;
	bh=yZkCWHuEK/o0AmEQiS1Zr55qPwe1WCUQ9P+2kgLX1Go=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qhFGjivWmgRdbKJGjjr3BQo2OlJiel3XG9FKSCA6gSCDpy+EDQ2NXbMGfp20QyJvynbwiD/sts4rNzT1WFZ+H7pT97Rf1I/QUjUJiWVoOyt9Yoy/QHnf5PqgRR4ot1kNCDm3qGNjqYKA2b6nffSYMbkRSz33Rx8EjnQKLEYdoqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com; spf=pass smtp.mailfrom=napatech.com; dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b=KOFj6IxU; arc=fail smtp.client-ip=18.184.203.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=napatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=napatech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=napatech.com header.i=@napatech.com header.b="KOFj6IxU"
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03lp2238.outbound.protection.outlook.com [104.47.51.238]) by mx-outbound12-252.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 13 Feb 2025 13:24:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUAdH7d4T//F6Pcj2rTRnZU+zKUGYwn4K8jCB7LdheWEkf1GZs0QB0r6YD7sOEvuKjNza/uTmhsVSG12KVqAXDhaVCMdRCy/mrTQNE8Imuw8VnWRnArePvShQePrS7O4KcYhhSqoknQwFnxqAtSHzseW7H6g+wyp4uGOcUB+Bb3keFDFqX7e3okwv4LS8nqalW75xPRfCAyA2ywuYfoGD9h2t7cFcGD6pQr0Pb023UOMqeVg3xaoZdn3qL2ImEKuy6oAYwjgV2izWz1O+mxuKgaCh+SUiZV/FB2yK8JTobvm2rwe2jwPZKB349PDX4MU/mU2czZrbtB6Gqywu7tI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meuKXqKIuW5kXgwSFuaYpnbIufDNxHiI7GlCR9Nl+ck=;
 b=ddfkLwwyrR5adAJWQlU4R9YFeIxJD+WeWAwKyopL7WmjmlCuE8TbsgDeXLjAdf6vfm1eQhSIbU+aCbRUGGTuM8y1wdfo5BMIytLLjBMZBVZFgUFoVmUr4IeF3jhdfizBO58kyxLntfmh85Tfp+1vVXgpCZQMmt05D9wbqIpXKuqTekjSFOiKjQFIm90t6zEP9AdeY1wq/z4HRDyYuI5wlF+YR+RAOiTlvprDA6eILkXTxPbU12XMzvAy7oC847xZw7oY57zEACSVikxsbj+88OlXdpNRMuUI6Rx8obUp8IH/IzESWMBA5j5+x4jjzuXryv9Q0e0QS/zHlqcBFYyMRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=napatech.com; dmarc=pass action=none header.from=napatech.com;
 dkim=pass header.d=napatech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=napatech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meuKXqKIuW5kXgwSFuaYpnbIufDNxHiI7GlCR9Nl+ck=;
 b=KOFj6IxUWei8aGZctXJlpavdNvrYToIsTvK1iSUrA/I/lsHEqSeNK+wU5PTr85n/sJtXy1TjflBcoVc7KhP1oANTKunLBxP3I7r3KySp5yficw3hGs36bORnaRMDGmY3yeMT71gMa4xWsdDMmTrp1JTjQINZmjEPXvTszgmnHmE=
Received: from DB6P190MB0262.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:3c::27) by
 VI0P190MB2161.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:258::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.15; Thu, 13 Feb 2025 13:09:39 +0000
Received: from DB6P190MB0262.EURP190.PROD.OUTLOOK.COM
 ([fe80::9476:ab78:cb8:2c7f]) by DB6P190MB0262.EURP190.PROD.OUTLOOK.COM
 ([fe80::9476:ab78:cb8:2c7f%5]) with mapi id 15.20.8422.010; Thu, 13 Feb 2025
 13:09:39 +0000
From: Sebastian Mauritsson <sma@napatech.com>
To: Parav Pandit <parav@nvidia.com>, Srujana Challa <schalla@marvell.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"anoobj@marvell.com" <anoobj@marvell.com>
Subject: RE: [PATCH RFC v3 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Topic: [PATCH RFC v3 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Index: AQHbbJVTLIDGLqarXUKh+rpKraYKVbNBD+kAgAREIpA=
Date: Thu, 13 Feb 2025 13:09:39 +0000
Message-ID:
 <DB6P190MB02627698A1A3A2A346309736CEFF2@DB6P190MB0262.EURP190.PROD.OUTLOOK.COM>
References: <20250122061644.266560-1-schalla@marvell.com>
 <20250122061644.266560-3-schalla@marvell.com>
 <CY8PR12MB71951C75DE4B72B480A64F42DCF22@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB71951C75DE4B72B480A64F42DCF22@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=napatech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6P190MB0262:EE_|VI0P190MB2161:EE_
x-ms-office365-filtering-correlation-id: acc748b1-dd8f-495d-6fbd-08dd4c2fac1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oueDmBKJ+qDODnLv1o5sr7l2X4RFe+HTco/gi08IrDVGKjQ/1OIcZIAzfMhs?=
 =?us-ascii?Q?KsV5BDBsVnbQS99NqmxD1k8CcuoeJP99y7sL1zNE8idBwQ5LvY5hJJf8elEo?=
 =?us-ascii?Q?giZMaQV8EVMhWl/I9604Xk7xhCCGn9J46P/kz3K/cB9aZU0iir+0NXsdTRXS?=
 =?us-ascii?Q?abo32GKQdOfqukctpCl5CekK3ntqCAmpGltVoh334EPqceACr3Hq4p7mH9H0?=
 =?us-ascii?Q?3OI2yB4VnuZnOchQsnQhFMuArGGgc504px4AqlHBTucbVMZzKwFQLyZD/lUQ?=
 =?us-ascii?Q?TscnW6serJmnWyEHKMikkdOUshHYuRVuymGMFgB7hitOECTsAg/T8qrtFPzr?=
 =?us-ascii?Q?4n/Sp/GGKvN2Fb+r94bH45i/xq1DUpzYq37V8uZzkjQle+q3trVlsoY0uXQG?=
 =?us-ascii?Q?u3if1xlPM71f8b+6nxh+d+wPRbzJ0y3aN8zvtHB9EOM6WMM6r1q3LNQzwusE?=
 =?us-ascii?Q?s0QjFnBadDmvlcC4ShrmdSQlyph5cugKBZJvvHAx5sHJrAmUmTXU90PCWfl0?=
 =?us-ascii?Q?ZkyS4T2L8oWZ4nCjKr5MUybYVkOTXQoNp1Xj8jVvdCbPwPaFTFjCV1OPevwB?=
 =?us-ascii?Q?T+qc96I3lxx9wIzwdLWKzac2IGILiM5sKra2PYeayBp/ZiKKzFZm5gfAtt8g?=
 =?us-ascii?Q?SOxPRqkGi54RO6GNXKppfua/B30J0eupNRdFoTrYllgWD411dU/1nJ801B1z?=
 =?us-ascii?Q?skKCmSyol5ajHyAR2VO51CdR556zuuyIFQqkrvZPuZTqxPZSJBRlFGa0DLUR?=
 =?us-ascii?Q?2ye/cHouUNpGwqzO3xynQ+ScurPRWZOyy9ILYMj++dSbldoESNhgA3CsqXYe?=
 =?us-ascii?Q?iqjtq7PAkIanv1bcCu/mnZbLi/h7/p91v57pVutE8vCdBKlaBjS8edrvFaOs?=
 =?us-ascii?Q?RVD22LVxpIzlE4WRbuJRKrCcgMnpS5yry1AgNmFsJt8IpKueScPwF0GGjF2s?=
 =?us-ascii?Q?3lfALVHeCge5InZTR6shmHuUdYrBp9J3ZxbStD7z31xJ3mqXrW0Fd8YwIWLe?=
 =?us-ascii?Q?DduBGPL7jFz3dJCE3+xHwVjUnKjbSDm1ap6OJ08K+QLR3FCa6dqm48xuGh5N?=
 =?us-ascii?Q?ERllbAxon+DvHwdQAAMUD3WOWFkq9NWvB50os3dxyNzvxVJPB1/Y11KxuOhW?=
 =?us-ascii?Q?YYTHbsgyXEMI1nXIicIGKiY/zptyEJh0fmsqEIV8ZAlLZtrecmcny+3Y3N4L?=
 =?us-ascii?Q?PvDUluhGL1GtYoD8VZvpdrrA8JlleIy/3Rx6+P00om9omeHOk9xvPGqce4zI?=
 =?us-ascii?Q?pQTkrF+IxoOG7J+Pucnvfa1+pM/yfpzmrgUjFB9RBmejZKoS0rtzn2GrUdKs?=
 =?us-ascii?Q?sJC/2jy3WemHtOpuiVv5koe7DS7LdJ89o8vehn4+XHFljwKIGgeSHCJmL8ol?=
 =?us-ascii?Q?vIUfyZXkhnTfNgiU6BplfCcx4FlZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6P190MB0262.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?y4q1+UafQjNVp99tvj+bkoF+2B76MVTvaWniwzwgVIQBBNaMoGy5wyMyVe2F?=
 =?us-ascii?Q?cVqJF8eHm2ShJicYUKrUu7DuY/rUMvMoSU1mfTkbpGWi4KdG5FjtqlpuvtR8?=
 =?us-ascii?Q?TBeEm9uRE1JezdYP1qE06tVPQbyVz9u59t/SdkN5xGAfAmrEvd8Gks72J4Bu?=
 =?us-ascii?Q?e9XNXrUBN6NlP5bPTDHQgBOFYDVrNkA4/Y/SJkHAKR/a7qEhxVXxJ+4Zc6J6?=
 =?us-ascii?Q?ccq4WhHw7A1YhCzLefma+GBBbG2GWhlbYPF7cPk6W15VEW343k64F8tDzp8D?=
 =?us-ascii?Q?3AMzaZnfBHvDjlQj7LhqnyJiiW63vvOKjV2QmXelTxkw0Xa5FDp46uIfFcDU?=
 =?us-ascii?Q?/47OCNQnAmbqn4/1UB/mGWxsbYliVEPGkjiDh2G0sS4KC1eCU59Z6MSglf8H?=
 =?us-ascii?Q?sVUP+b+cbw3fgsdgV4ZitSstyiHzA8Cvq3mTunL42FCi4rKzS9vcHQEEPonH?=
 =?us-ascii?Q?SruMNwjpqaVbJTQf0Ab5RkwEZEtm21R5JOAXIa1XqnywcOWWU448WTzOTHIv?=
 =?us-ascii?Q?wHHUV08H1BSXAwLIuBEusA3x/NFwXKLyuK3OzEPfpT5VJvYlpcHy0W3I1BSM?=
 =?us-ascii?Q?gs6G+ldY3PyM3O4fchKsiVzlCYRMmnt/zIQwNmsMpERcrtA14N2RAtv8nMiZ?=
 =?us-ascii?Q?IgJmeX7mRIsHJCcnndZdWCJJAkVVz78vrGX8x+vp04uFbbm5COcbsqO/tbnN?=
 =?us-ascii?Q?2N3N5AJvBimupOR3OicofEXH6+NNTE2lBjltP/ofmh0yr7Sg9vFd3C9/26d2?=
 =?us-ascii?Q?y+bYIJqPSF0yNB5r9JIXybDb7EuXir3J5jM0SfEBI+BLkbTZL2eMfS8/jJmP?=
 =?us-ascii?Q?kRZEUkMv/ef5ucSyYQ3Cn+ExPY48a+PhG+7FhYBG7umOWrhjCPtIEHwNG2Dv?=
 =?us-ascii?Q?67uQD5lxUbIX1kb00YpjeORaPJ/nhjDQX25tAtdwvcaXtt5QIzQt5SnB7Jyz?=
 =?us-ascii?Q?+0j4ZHx0ffRih3sLlM84ya/U2pMuQgb/lOa4APMzW+4L/9QBHy704YAOa5Pu?=
 =?us-ascii?Q?+kIjEAh3WEbDWefH7KZT0NSB8Wh224CLaFjzaOSOfBbhZYwOQ8KTOKRMtUoG?=
 =?us-ascii?Q?FiRHISfcQy8EwXvhk01DZgcK5G84SvbKY/6p6IOE8yWjhJgX3Dg46QC0IfPN?=
 =?us-ascii?Q?UINQNBvbIG+FZ80GE1jLOeALj5OAVFO7VlmKa7C3L6bb1Fj5cWOhe4XTT5fF?=
 =?us-ascii?Q?TCWF2zvpSEByjB56X6BfLxpbCXCiBqlKgBWBivFOxuRHrDNexw4uC+MyH/7r?=
 =?us-ascii?Q?bmd4NZNr8E1U+pLUvXjcCbZ0HpdW9cIix+qGlpxbzT1R35573BY4yiAXh9JP?=
 =?us-ascii?Q?Ia/ptAmIvSl/STyHowTasdSWERlxh8Dc7TtO7q0TCPVgABkz0ZXnGLLBpGO5?=
 =?us-ascii?Q?JkgUEbQDnLpIk+tRlXy0lSfdgN3zSzI6luuNMujwnpsqIyRJcrkrZu2ipeeV?=
 =?us-ascii?Q?ZZpeGLSmKTcSSHBv823RwsW6rZyqMBltaAUKP4HxJk/9ar4VNChrv6RZNL99?=
 =?us-ascii?Q?hMpOHPMZH1wDLi+OkXmtTtl7qoQCfmMsV4Z88oqv5lPqUjY7pbDRGHRBmHEk?=
 =?us-ascii?Q?EagzjMw1J8eeJQJR0Nw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 4WiwNfDEvW8YQ0aj876JwuPShfhKAKUrzpXVjVprVUZuomJP46252nYXI5Moj/cORB02sLw9fhgMTeqKVWN1+Y/Znz2l+KEMg7Mhvu6tWVsOZKbP3l8aXUnP/INgeOvrhBEkgPaVfdVQBdwQjof5yi03/HM2YVsKbXQP1bOwtnULKzQ8Nv+WkH9cfxXjTtD/KH857q6gDgq3MQZgvJW2xe3FAnsN+oXXi5QcoSIc18rUYhDx1ouo6gidPBrdz8UAO/G+QAdMGqQSCOf7jL40UsccuLSikndLmjz+eTqCTWW2u+yB9MvCGmOdXy+4mmrlrYLgSO3FsGd0x3+rlHd/rYRugdJl7lYsDyHShilW2CqXKcepSiPgu0Tr0x6K1kFt9VD9EkjgJwXHKe4pbwa0yI/mkGyslWH+UccLMbEfQFqTCghJ5FClv/3x0nHUbQ8yzVzN9GnFszMqm6dM8fRl68PYntsI2UxgKVCjB6kgMKXQ2oFkXa7ShxfFMHbBTQxtRRVnVRWMQmEALMgc0qEwv4qXVY5cW3ZADtLvEHPNGeRzVmSoJM3pgvigqR8FOJAPp+9rIgjAK404CytToKdKUWB3xa3+hZZFWSG6E4BfIuGdMbPGb39S7JpwDg5IDLjXFlYoopUzIoHTVHWW/2wTkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0262.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acc748b1-dd8f-495d-6fbd-08dd4c2fac1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 13:09:39.0901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c4540d0b-728a-4233-9da5-9ea30c7ec3ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0tXizrtlIEDTvjo9kLTkVnGbbESIM4LlRlXMc9tGYnGEuLEMePV0QN2gIY4IV6TBcC51b0BtpHnncnt4Z3ybA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P190MB2161
X-OriginatorOrg: napatech.com
X-BESS-ID: 1739453064-303324-7587-1368-1
X-BESS-VER: 2019.1_20250210.2217
X-BESS-Apparent-Source-IP: 104.47.51.238
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVpaWZmZAVgZQ0NTEwsjINCXF0N
	wwJSU5ydDY3DTVxCTRPNXI0MzIyNxUqTYWAI6mJCxBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.262475 [from 
	cloudscan11-168.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS113687 scores of KILL_LEVEL=7.0 tests=BSF_SC0_MISMATCH_TO, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1



> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, February 10, 2025 8:47 PM
> To: Srujana Challa <schalla@marvell.com>; virtio-comment@lists.linux.dev
> Cc: mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.com;
> sburla@marvell.com; ndabilpuram@marvell.com; jerinj@marvell.com;
> anoobj@marvell.com
> Subject: RE: [PATCH RFC v3 2/4] virtio-crypto: Add resource objects for I=
Psec
> outbound and inbound SAs
>
>
>
> > From: Srujana Challa <schalla@marvell.com>
> > Sent: Wednesday, January 22, 2025 11:47 AM
> >
> > This commit introduces resource objects to enable the driver/device to
> > create IPsec Security Associations (SAs) for both inbound and outbound
> directions.
> >
> > The IPsec SA objects include essential parameters required for packet
> > outbound and inbound processing, such as SPI, tunnel headers, IPsec
> > mode, IPsec options and cipher/authentication specific data.
> >
> > Signed-off-by: Srujana Challa <schalla@marvell.com>
> > ---
> >  device-types/crypto/description.tex | 145
> > ++++++++++++++++++++++++++++
> >  1 file changed, 145 insertions(+)
> >
> > diff --git a/device-types/crypto/description.tex b/device-
> > types/crypto/description.tex index 2c00e50..0ba09df 100644
> > --- a/device-types/crypto/description.tex
> > +++ b/device-types/crypto/description.tex
> > @@ -336,6 +336,20 @@ \subsection{Device and driver
> > capabilities}\label{sec:Device Types / Crypto Devi  \hline
> > \end{tabularx}
> >
> > +\subsection{Device resource objects}\label{sec:Device Types / Crypto
> > +Device / Device resource objects}
> > +
> > +The crypto device has the following resource objects.
> > +
> > +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline type & Name &
> > +Description \\ \hline \hline
> > +0x0200 & \hyperref[par:Device Types / Crypto Device / Device
> > +Operation / IPsec Service Operation / Resource objects /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-
> > SA]{VIRTIO_CRYPTO_RESOURCE_OB
> > +J_IPSEC_OUTBOUND_SA} & IPsec outbound SA resource object \\ \hline
> > +0x0201 & \hyperref[par:Device Types / Crypto Device / Device
> > +Operation / IPsec Service Operation / Resource objects /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-
> > SA]{VIRTIO_CRYPTO_RESOURCE_OBJ
> > +_IPSEC_INBOUND_SA} & IPsec inbound SA resource object \\ \hline
> > +\end{tabularx}
> > +
> >  \subsection{Device Operation}\label{sec:Device Types / Crypto Device
> > / Device Operation}
> >
> >  The operation of a virtio crypto device is driven by requests placed
> > on the virtqueues.
> > @@ -2028,3 +2042,134 @@ \subsubsection{IPSEC Service
> > Operation}\label{sec:Device Types / Crypto Device /  \hline
> > \end{tabularx} \end{table}
> > +
> > +\paragraph{Resource objects}
> > +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> > +Service Operation / Resource objects}
> > +
> >
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\lab
> > el{par:D
> > +evice Types / Crypto Device / Device Operation / IPsec Service
> > +Operation / Resource objects /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
> > +
> > +A driver can have outbound SAs between 0 and \field{outb_sa_limit},
> > +as specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For
> > +the IPsec outbound SA resource object
> > +\field{resource_obj_specific_data} is in the format \field{struct
> virtio_crypto_resource_obj_ipsec_sa}.
> > +
> > +\begin{lstlisting}
> > +struct in_addr {
> > +        le32 s_addr;
> > +};
> > +
> > +struct in6_addr {
> > +        union {
> > +                u8  S6_u8[16];
> > +                le32 S6_u32[4];
> > +                le64 S6_u64[2];
> > +        } S6_un;
> > +};
> > +
> Any reason for union? Can we just have s6_u8?
> (s6 in small).
>
> > +struct virtio_crypto_ipsec_tunnel_param {
> > +        /* Tunnel type: IPv4 or IPv6 */
> > +        u8 type;
> > +        u8 reserved[3];
> > +        union {
> > +                /* IPv4 tunnel header parameters */
> > +                struct {
> > +                        /* IPv4 source address */
> > +                        struct in_addr src_ip;
> > +                        /* IPv4 destination address */
> > +                        struct in_addr dst_ip;
> > +                        /* IPv4 Differentiated Services Code Point */
> > +                        u8 dscp;
> > +                        /* IPv4 Don't Fragment bit */
> > +                        u8 df;
> > +                        /* IPv4 Time To Live */
> > +                        u8 ttl;
> Please add padding bytes to align to 32-bit.
> > +                } ipv4;
> > +                /* IPv6 tunnel header parameters */
> > +                struct {
> > +                        /* IPv6 source address */
> > +                        struct in6_addr src_addr;
> > +                        /* IPv6 destination address */
> > +                        struct in6_addr dst_addr;
> > +                        /* IPv6 flow label */
> > +                        le32 flabel;
> > +                        /* IPv6 hop limit */
> > +                        u8 hlimit;
> > +                        /* IPv6 Differentiated Services Code Point */
> > +                        u8 dscp;
> This one too. Please check in both the series, vnet ipsec and this one.
>
> > +                } ipv6;
> > +        };
> > +};
> > +
> > +struct virtio_crypto_resource_obj_ipsec_sa {
> > +        le32 spi;
> > +        le32 salt;
> > +        le64 options;
> > +        struct virtio_crypto_ipsec_tunnel_param param;
> > +        le64 esn;
> > +        le16 udp_sport;
> > +        le16 udp_dport;
> > +        le32 replay_win_sz;
> > +        le64 cipher_algo;
> > +        struct {
> > +            le16 length;
> > +            u8 data[];
> > +        } cipher_key;
> > +        le64 auth_algo;
> > +        struct {
> > +            le16 length;
> > +            u8 data[];
> > +        } auth_key;
> Two dynamic arrays in one is problematic.
> And below fields can never be referenced without learning the length of a=
uth_key
> and cipher_key.
> Below are critical fields to access the whole rest of the object.
> So please move them at start.
>
> Also can we have above two dynamic array as constant size array, instead =
of
> dynamic?
>
> > +        le32 obj_id;
> > +        u8 mode;
> > +        u8 direction;
> > +}
> > +\end{lstlisting}

Have you considered having a lifetime entry in struct virtio_crypto_resourc=
e_obj_ipsec_sa? Compare for example with https://doc.dpdk.org/api/structrte=
__security__ipsec__xform.html. I realize it may be handled by the applicati=
on doing the SA configuration to keep track of this, but could it be consid=
ered to include it in the specification since having a hard cap on the key =
usage is such an important part of the IPsec concept?

> > +
> > +\field{spi} is the Security Parameter Index(SPI) used to uniquely
> > +identify the
> > IPsec SA.
> > +\field{salt} is the 32 bit salt value used in the cryptographic operat=
ions.
> > +
> > +\field{options} specifies the Options for configuring the IPsec SA,
> > +see \ref{table:Device Types / Crypto Device / Device Operation /
> > +IPsec Service
> > Operation / Device and driver capabilities /
> > VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
> > +
> > +\field{param} specifies the parameters for IPsec tunnel mode.
> > +\field{esn} is the starting sequence number.
> > +\field{udp_sport} is the source port for UDP encapsulation.
> > +\field{udp_dport} is the destination port for UDP encapsulation.
> > +\field{replay_win_sz} is the anti-replay window size to enable
> > +sequence replay attack handling, replay checking is disabled if the wi=
ndow size
> is 0.
> > +
> > +\field{cipher_algo} is the cipher algorithm identifier see
> > +\ref{sec:Device Types / Crypto Device / Supported crypto services  /
> > +CIPHER services} \field{cipher_key} specifies the cipher key and its l=
ength.
> > +\field{auth_algo} is the Authentication algorithm identifier
> > +\field{auth_key} specifies the authentication key data and its length.
> > +\field{obj_id} specifies the object id of the SA that can be used to
> > +retrieve driver-defined data associated with the IPsec SA.
> > +
> > +\field{mode} specifies the mode of the IPsec SA, see
> > +\ref{table:Device Types / Crypto Device / Device Operation / IPsec
> > +Service Operation / Device
> > and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
> > +
> > +\field{direction} specifies IPsec SA direction.
> > +
> > +\begin{table}[H]
> > +\caption{IPsec Direction}
> > +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> > +Service Operation / Device and driver capabilities /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec Direction}
> > +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Type & Name &
> > +Description \\ \hline \hline
> > +0x0 & - & Reserved \\
> > +\hline
> > +0x1 & VIRTIO_CRYPTO_IPSEC_DIR_OUTBOUND & IPsec direction outbound
> > \\
> > +\hline
> > +0x2 & VIRTIO_CRYPTO_IPSEC_DIR_INBOUND & IPsec direction inbound \\
> > +\hline \end{tabularx} \end{table}
> > +
> > +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA}\label
> > {par:De
> > +vice Types / Crypto Device / Device Operation / IPsec Service
> > +Operation / Resource objects /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA}
> > +
> > +A driver can have inbound SAs between 0 and \field{inb_sa_limit}, as
> > +specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the
> > +IPsec inbound SA resource object \field{resource_obj_specific_data}
> > +is in the format \field{struct virtio_crypto_resource_obj_ipsec_sa}.
> > --
> > 2.25.1
>

Disclaimer: This email and any files transmitted with it may contain confid=
ential information intended for the addressee(s) only. The information is n=
ot to be surrendered or copied to unauthorized persons. If you have receive=
d this communication in error, please notify the sender immediately and del=
ete this e-mail from your system.
