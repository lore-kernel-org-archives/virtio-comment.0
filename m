Return-Path: <virtio-comment-return-6611-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98C0EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 16:47:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E031B1318C6
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 16:47:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BDE189866E7
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 16:47:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A814C9865D5; Thu, 29 Jun 2023 16:47:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 940569865D8;
	Thu, 29 Jun 2023 16:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLkEqY2Cm2F0tp9mW2xI1h02xT2m0upRY4xLuW7zIUeZQpBnM+ENMJzF3XzBbXnnv5F0Ayt4vU3f1zTA78PGPiy746+UYiURePKYBrd0DcCJJ3bmduhH47/Akk2vcwKa6GWQvPfbgMDTURJy+QLjNyYIFx8wCSnpNP21IqjjC7UPmN9yMu9YX10zwjleERrbdFyBBdmqb35GzmLWOPe81mC1lFg3vpYYpLX4+C30m01dQI+EjU0hxLwgMhiq/Jf4NXpPBDiXeuqDY8DoSl2Ccw+PXEJdMFKxLhczhnGQFQHx6gf4EUyPjddmhnIaeu4j1QyKjJ6Gm38HbH4ADjtp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMlWEdKh3Oa2AX9UfXUQJj91iRojLG5JCAkRcJR0KkQ=;
 b=Ilw51hRQuRIktvGjN6E87xb7t95KxkcQ70idZ/KZ4LYLAydMcmK4CDA3GESGaDRoQH5Hzfv2+s/1zT1JVSjebJKsqaklBg/Jjou/MuYKbLll2BsGtLur574YyklSvHxfCjXIXfjL/i6sT7A+SNkaSkx5D7v1+NGGvzU/miqQmo68QlHgM0vCF0etv00Y7GmJ1N8JRDXK/mYMWvR3Jyy7SMY6xkzpQuNpwulzswNq9goqnR68sngNSkeTTw043Z7DsmyLfn8ZctBR7Ax9CtMW/2viohg5I19B+dMS+y5wO/1qBA21OIFCQMSL9sR7lcLpR2bqZzniGip/ENFE6D10MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed
Thread-Index:
 AdmpVpzpKKBUbqM4Qgq425cUop3WcQAO9SoAAAusrWAAG7XmgAAACPggAACt3gAAAAnhcAAC2RKAAAAs+0AABTUUgAAVGBgQ
Date: Thu, 29 Jun 2023 16:47:18 +0000
Message-ID:
 <PH0PR12MB54815C2F64879A6231218320DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB5481821452DA2A9572714BB9DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6b95e5ec-37e7-7150-9926-6bb02ee13cf3@intel.com>
 <PH0PR12MB54818AEB1A85069B42B97158DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1bdd18c7-c4bd-8049-ee63-227fe25fb7a5@intel.com>
 <PH0PR12MB5481F5D8B77067A8CDCB5A9FDC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f558c9f4-ca06-ba68-67f6-49f649097b05@intel.com>
 <PH0PR12MB5481532D87D5606D90938B39DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <21362b40-9d40-8c56-30e1-1bc166d622be@intel.com>
 <PH0PR12MB5481D899B11168F30AACB572DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e1b005d1-6ab6-6f9b-cea0-2b548b9f01de@intel.com>
In-Reply-To: <e1b005d1-6ab6-6f9b-cea0-2b548b9f01de@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8072:EE_
x-ms-office365-filtering-correlation-id: cdf93c4b-183e-4c54-4a6b-08db78c0806a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kezyX7ii1wBT/eDv7U82poeBOizNhe7LhTckK1zmZUEEq7myVkZQgUFe6fVf5LvoCtjvEfBeVFpxSYtu3mISOak5HoGnuzyqIoqAU0Fl6dQ25JFlzDw3h6ReWKkBtJE0zxhgCaE4TqbgZsVEUU5r06wpXIf1CL5bbkVGW7mT/Flth38Qd62SRxI1GWPdNL8F+syjw9mFzWyeRXyfzDPWOA2W9+PRwfiim7Ij49s3fxhCazch+DNHyTBePT6gCNDwAbY1aaDCvupyG/iinZhdQ9Z0r1BN2Lz+FLifJXK8gJmeY9w0dd2aSJblVJojUSIwsAhv706ivBS7OL90+DyDGYVxIN4ojWiWVFUpxSsVDdOBC4CKB48zPRepjn93Gsgb3FVn8gbSZGftepi3fiYBXl4UTrV2TvHbvBLMB2BG26h48AaslDzm1yT0GsRewEuPdmzhZcPeMIae91/VckmuiCi/zvxhkWCcHO03L2r3D9R0W7C+8diGpv5+Q9VOppgbw+jb8HWUitf1dBjl868zu3Sq2pD4JRI0CCxaPiB7S2+Vbzj/i0UPqbl9AkVLCZkSf+lqxweUkGgtWYEW4oP0hPe21Sdh6jxmv3yGavzEdeU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199021)(7696005)(2906002)(9686003)(71200400001)(83380400001)(38100700002)(122000001)(26005)(6506007)(186003)(55016003)(41300700001)(86362001)(54906003)(38070700005)(4326008)(5660300002)(478600001)(66946007)(76116006)(33656002)(66556008)(66476007)(66446008)(6916009)(64756008)(8676002)(8936002)(52536014)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekczUjNQaGdvM0ZwQmIwRmVVSUNwb2EveUFscHVVZzBYY0VmZ1lIRDBORk1C?=
 =?utf-8?B?OXd5dUNSQldFWnN4dW93ZU9qZEUydmZyVUZuVVhkZ1lDUkdlb2JRTDBrdHVE?=
 =?utf-8?B?RmRmQlJUTjRoTi93UDhsdGI5MmZJak5yN0NqME9FZHZuWHdoODZBUGtkNWR6?=
 =?utf-8?B?STAxRng2dFpHUkNIdTJIN3FXWDgyS0VMdUtOK2psaUUzYnpSWVlKejhuMzQx?=
 =?utf-8?B?OEFVZCtoSW9zVDYxREo2alA1OExxTFUzcUhBdnkvaitja0tiUXNtc2lhdTBR?=
 =?utf-8?B?TENGVmM4VTYySkZuM1BTU0pkT1Q0a2FNMFRjMkROUlZXN1hYSU5pc0d4YTZJ?=
 =?utf-8?B?UE1DNDBrZ2ZhcllmRmEza3JkaHBYb1hOMGVEZWx1NEhJb1NpazNSbnBoVHMw?=
 =?utf-8?B?TUJHcXk3QzhWSTdJVW96TENsTUxrS3kzdTBReHkrWkgzZmFMQnB0TW11bU1T?=
 =?utf-8?B?bi83aGhveEJvcWxpSXpGTFpkK1FFallqc3h6S2l6M3lNQkRXbS95U2xBRDMx?=
 =?utf-8?B?VEp6Ujd4Y3JMSjc5U0djd2xXS3JnUnlpM1BsTVF1V0NXUUtQY21SZlZQNHpT?=
 =?utf-8?B?bTRMZDQ0TGdBUElLZkYwVU5zTzRXVlFMUVVYYmxCTnhiTnFBWEVIRGdrWnVu?=
 =?utf-8?B?b0pYNEFFVlRzNDdHWW9SSWhRc09GQzNkZ2RFdnlhM1JvbmZ0cWlTeVJJVVUx?=
 =?utf-8?B?QWlpSlRVZXQ3WW1yQUdSQ0tiWFZvV3JadlhGK2Z1L3JOcU96WGlwRTZlN3Nr?=
 =?utf-8?B?ZGNPam9aMi9FR1JwQjV0d3VyTHgvWC91a1RxV3RsaVBjaXJlU1UvK3FkL1FT?=
 =?utf-8?B?Q1QxVTY3WU1TNytDQWFJWGFMZS9FcW5kU0pRbmpkcXhEUzVEVXgrak1zbVpp?=
 =?utf-8?B?ZURERkNSbXllM2x3T0J1bi8zcTBzenU5VzYxNnY5b01qL0dsdURlYmpXODhM?=
 =?utf-8?B?em5ML2lOdUZqaHFGaDh4K25DRjRPNjIwN3FVeVlFRXJuSGNWU1hJTWsyRDdP?=
 =?utf-8?B?S0g2WmNCM3FHLy9OeHBBVFFDeDNoWjIrQWZCY1Y0QzY0dzNsK3lld3Fla0t6?=
 =?utf-8?B?ZmpPNTgyOFJjaFBEd3g1Q0pYVmJXZDdvOHJTMGprTnRLQmZ4UjNJQVljUWZv?=
 =?utf-8?B?eHpyeTlmWW16ZkFpbnJzalJ6eFNZekpLemlsNDVWMldWSHliNWRYVnNwVkQ0?=
 =?utf-8?B?dGhBUkk0OWhmZ2xHdEloenJ2aWZpNmRVR0tmdVdVTDIwaFZrZDEvMmJuS0Zm?=
 =?utf-8?B?R25rcXZ4aytMWUpJQ29WRWswTnBLM2hva0JneXBrTlNtV3FIZ3dQYmsxN2FZ?=
 =?utf-8?B?ejRZUUZaRWpMWHZJVlZpYmpKS0VvVk5nUmxhaXVpOENGWjBsQ0ptQzc4ZEho?=
 =?utf-8?B?cjJzSG5pN21FMTFmSkFwSDFFQUpOVm9lSjlUSnQwQ3JIejBTNHNIMVZOZ2I3?=
 =?utf-8?B?WlhFb2UwVmFjaU1kaEwxMHFPcGNjbkU0eVR3UXJkRVA3UmJ5K1NxVzV4c2Vw?=
 =?utf-8?B?NnBuajExOVd1cnJkMnBwQmh5Z21wKzRqZ1ZXUkpjTit6YUQ0QnA4bkx4NjVW?=
 =?utf-8?B?K0xpdDR5WWo1QjI2VE9CQlV2WWwrOW51YjRNblNZUUhDemR2UDloTk9TWmFL?=
 =?utf-8?B?TThwem5WODVpc0pUY0hkK2pFSlh2SHpDQ0dJdkpwUHB4MWVyZ2t5dURmMXFu?=
 =?utf-8?B?M05FSnRNeStUZDNrTlhLZVA4bml3SXk5TWdqUXpzYWNtY2pINnZmdEIyY3Y3?=
 =?utf-8?B?U080N3hqdlRhazBLejNxamtRWC9NeDBwUUxqbHMwdHVSNFFmZE9VYkx0STJO?=
 =?utf-8?B?Nk5IZHJtWFJ2OUdaRktQTmN5Mkl0VU1wSDJhV0c1Ukk4MStXRG9TMTRYeEdK?=
 =?utf-8?B?SDV2cWthV1JZeVpOU01EY0drUFoxM3ptTW13U2R3d1BKejhLcllzQ3N6eGRG?=
 =?utf-8?B?cVdleG5FcEI1Q3A1aXBjL3pTdVBZdEE5b1dxRmZtWXMwby9weEYyNDc5ZUUy?=
 =?utf-8?B?dnBGaEtsTDVISVlsbkdJMGthNFk4TWxEOEhQcDFMOHNkRndKcDdKKzBIWVM5?=
 =?utf-8?B?ZE04ZTN2SkdjUHpTYnY3aFJmU0p4bHBMZTE4SXJCQnhzbDZNcW9Id2U1R0Vj?=
 =?utf-8?Q?ynCM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf93c4b-183e-4c54-4a6b-08db78c0806a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 16:47:18.6355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbbKQdKloCsDJ5PJsxf7DfSomkpAXZKtJlZHPCuxyEMfRk6V+/lQTFMXq6nABQgiWq7SzYrIEImwettgosCCVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072
Subject: RE: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFRodXJzZGF5LCBKdW5lIDI5LCAyMDIzIDI6MzYgQU0NCg0KPiA+IEkgbWVhbiBxdWVyeWluZyBh
bmQgcHJvdmlzaW9uaW5nIGZlYXR1cmUgYml0cyBhbmQgY29uZmlnIHNwYWNlIGZpZWxkcyBpcyB0
aGUNCj4gYmFzaWMgZnVuY3Rpb25hbGl0eSBiZWZvcmUgYXR0ZW1wdGluZyB0byBzZWN1cmluZyBp
dC4NCj4gSXQgbWF5IGJlIGZpbmUgdG8gX09OTFlfIHByb3Zpc2lvbiB2aXJ0aW8gY29uZmlndXJh
dGlvbiB0aHJvdWdoIEFRLCBsaW1pdCB0aGUNCj4gY2hhbmdlcyBpbiB2aXJ0aW8gc3BlYy4NCj4g
QWN0dWFsbHkgdGhpcyBpcyBub3QgcHJvdmlzaW9uaW5nIGEgVkYsIHRoaXMgaXMgbW9kaWZpY2F0
aW9uIGFmdGVyIGNyZWF0aW9uLCBiZWNhdXNlDQo+IHdlIHN0aWxsIGNyZWF0ZSBhIFZGIHRocm91
Z2ggUENJIGludGVyZmFjZSBudW1fdmZzLg0KDQpJdCBpcyBhIG1vZGlmaWNhdGlvbiBiZWZvcmUg
YSBWRiBpcyBnaXZlbiB0byB0aGUgZ3Vlc3QuDQoNCj4gPiBJIHdhcyB0b2xkIHRoYXQgeW91IGFy
ZSBnb2luZyB0byByZWJhc2UgdGhlIHR2cSBzZXJpZXMgb24gdG9wIG9mIEFRLCBoZW5jZSB0aGUN
Cj4gYXNrIHRvIHNwbGl0IHRoZSBzZXJpZXMgdG8gdHdvLg0KPiA+IElmIEkgbWlzdW5kZXJzdG9v
ZCwgaXRzIGZpbmUsIG15IGJhZC4NCj4gPiBTb21lb25lIGVsc2Ugd2lsbCBwaWNrIHVwIHRoZSBm
ZWF0dXJlcy9jb25maWcgcHJvdmlzaW9uaW5nK3F1ZXJ5IHBhcnQuDQo+IElmIHlvdSB3YW50IHRv
IHJlLXVzZSBzb21lIHRyYW5zcG9ydCBjbWRzIGZvciBTUklPViwgdGhhdCdzIGZpbmUsIHdlIGp1
c3QgY2FuIG5vdA0KPiByZXVzZSB0aGUgd2hvbGUgY29tbWFuZCBzZXQgZm9yIFNSSU9WLg0KU3Vy
ZS4NCg0KPiBGb3IgZXhhbXBsZSwgd2UgZXhwZWN0IEFRIGFzIGEgdHJhbnNwb3J0IGZvciBTSU9W
LCB0aGVyZWZvcmUgTVNJWCBpcyBjb25maWctZWQNCj4gdGhyb3VnaCBBUSwgYXMgd2UgZGlzY3Vz
c2VkIHRoaXMgc2V0X21zaXhfY21kIG1heSBub3QgYXBwbHkgdG8gU1JJT1YgZm9yDQo+IG5vdy4N
Cj4NCk1TSVggcHJvdmlzaW9uaW5nIGZvciBTSU9WIGFuZCBTUklPViBhcHBsaWVzIHRocm91Z2gg
dGhlIEFRLg0KQ29uZmlndXJpbmcgdGhlIE1TSVggZW50cnkgaXRzZWxmIGJ5IHRoZSBkZXZpY2Ug
aXMgbm90IHRocm91Z2ggdGhlIEFRLCBpdCBtdXN0IGEgZGlyZWN0IGNoYW5uZWwgd2l0aG91dCBt
ZWRpYXRpb24uDQpUaGlzIGlzIGRpZmZlcmVudCBkaXNjdXNzaW9uIHRvIGRvIHdoZW4gU0lPViBS
MiBjb21lcyBpbiBwbGFjZSwgdGhlIHNwZWMgaXMgdW5kZXIgV0lQIHNvIG5vIHBvaW50IGluIGRl
YmF0aW5nIGZvciBub3cuDQogDQo+IFF1ZXJ5aW5nIGlzIGZpbmUgYXMgeW91IGtub3cgaXQgaXMg
cmVhZCBvbmx5Lg0KPiBGb3Igc2V0dGluZywgSSBhc3N1bWUgd2UgbmVlZCBhIG5ldyBtZWNoYW5p
c20gdG8gc3ljbiB0aGUgUENJIGNvbmZpZyBzcGFjZQ0KPiB3aXRoIEFRLCBhbmQgc3RpbGwgdGhl
IGhvc3Qgb3ducyB0aGUgQVEuDQo+IA0KVGhlcmUgaXMgbm8gZ29vZCByZWFzb24gZXN0YWJsaXNo
IGZvciB0aGlzIG5lZWQuIFNvIEkgZG9u4oCZdCB0aGUgcG9pbnQgb2Ygb25seSBhc3NlcnRpbmcu
IDopDQpIeXBlcnZpc29yIHN3IGFscmVhZHkgdGFrZXMgY2FyZSB0byBub3QgbWVzcyBhbmQgVkZz
IGdpdmVuIHRvIHRoZSBWTSBhbmQgZG9lcyBub3QgdG91Y2ggaXQuDQpIZW5jZSwgSSBkb27igJl0
IHNlZSBhIG5lZWQgZm9yIG92ZXIgZW5naW5lZXJpbmcgaGVyZS4NCk9uY2UgdGhlcmUgaXMgc29s
aWQgcmFjZSBjb25kaXRpb24gZXhwbGFpbmVkIHRoYXQgcmVxdWlyZXMgc3luYywgaXQgaXMgYmV0
dGVyIHRvIGRvIHRoYXQgdGltZS4NCg0KPiA+DQo+ID4+Pj4gSSBzdGlsbCB0aGluayB3ZSBzaG91
bGQgcmVzb2x2ZSB0aGUgaXNzdWVzIGZpcnN0Lg0KPiA+Pj4gSSBkb27igJl0IHRoaW5rIHRoaXMg
aXMgcmVhbGx5IGFuIGlzc3VlLg0KPiA+Pj4gUGFzc3Rocm91Z2ggVkYgZGV2aWNlcyBhcmUgYWxy
ZWFkeSB0aGVyZSBmb3IgbW9yZSB0aGFuIGEgZGVjYWRlIGFuZA0KPiA+Pj4gbXNpeA0KPiA+PiBj
b25maWcgaXMganVzdCBvbmUgc21hbGwgcGllY2Ugb2YgaXQgdG8gcHJvdmlzaW9uLCBhbW9uZyBv
dGhlcnMuDQo+ID4+IHBhc3N0aHJvdWdoLCBsaWtlIHZmaW8gd2hpY2ggYXNzaWduIHRoZSBkZXZp
Y2UgaW5jbHVkaW5nIGl0cyBjb25maWcNCj4gPj4gc3BhY2UgdG8gYSBndWVzdCwgd29ya3Mgd2Vs
bC4gV2hpbGUgQVEgaXMgYSBzaWRlIGNoYW5uZWwuDQo+ID4gU3VyZS4gQVEgaXMgc2lkZSBjaGFu
bmVsIGJ1dCBoeXBlcnZpc29yJ3MgYWJpbGl0eSB0byBhY2Nlc3MgVkYgd2hpbGUgaW4gdXNlDQo+
IGluY2x1ZGluZyBkb2luZyBGTFIgYW5kIG1vcmUgaXMgYWxyZWFkeSBleGlzdC4NCj4gYSBoeXBl
cnZpc29yIHNob3VsZCBub3QgcmVzZXQgYW55dGhpbmcgd2hlbiB0aGUgZGV2aWNlIGhhcyBiZWVu
DQo+IHBhc3N0aHJvdWdoZWQsIG9yIHN1Y2ggYSBoeXBlcnZpc29yIG1heSBiZSBjb25zaWRlcmVk
IGJ1Z2d5DQo+ID4gU28gc3VjaCB0aGluZyBkb2VzIG5vdCBuZWVkIHNwZWNpYWwgc3BlYyBsZXZl
bCBwcm90ZWN0aW9uLg0KPiA+IEFuIE9TIGRyaXZlciBjYW4gaGFuZGxlIGl0IGludGVybmFsbHku
DQo+IGFnYWluLCBJIHdpc2ggd2UgZG9uJ3QgaW50cm9kdWNlIG1vcmUgYXR0YWNraW5nIHN1cmZh
Y2UgZXZlbiB0aGUgc3RhY2sgaXMgYWxyZWFkeQ0KPiB2dWxuZXJhYmxlLg0KVGhlcmUgaXMgbm8g
YXR0YWNrIHN1cmZhY2UgYWRkZWQuIEl0IGlzIHdpdGhpbmcgdGhlIGh5cGVydmlzb3IgYm91bmRh
cnkgb3duZWQgYnkgdGhlIG93bmVyIGRldmljZSBkcml2ZXIuDQpIb3cgdG8gYWNjZXNzIGEgb3du
ZXIgZHJpdmVyIGlzIHJvbGUgb2YgaHlwZXJ2aXNvciBPUyBsaWtlIGhvdyBpdHMgZG9uZSB0b2Rh
eSBmb3IgdmlydGlvIGFuZCBub24gdmlydGlvIGRldmljZXMsIG5vdCByZWFsbHkgdGhlIHZpcnRp
byBzcGVjLg0K

